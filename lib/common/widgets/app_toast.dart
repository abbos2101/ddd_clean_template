import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

// ─── Enum ────────────────────────────────────────────────────────────────────

enum ToastType { success, error, warning, info }

// ─── Public API ──────────────────────────────────────────────────────────────

class AppToast {
  const AppToast._();

  static void show(
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    _ToastService.show(message, type: type, duration: duration);
  }

  static void success(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) => show(message, type: ToastType.success, duration: duration);

  static void error(
    String message, {
    Duration duration = const Duration(seconds: 5),
  }) => show(message, type: ToastType.error, duration: duration);

  static void warning(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) => show(message, type: ToastType.warning, duration: duration);

  static void info(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) => show(message, type: ToastType.info, duration: duration);
}

// ─── Internal Service ─────────────────────────────────────────────────────────

class _ToastService {
  const _ToastService._();

  static final List<_ToastDataModel> _toasts = [];
  static const _maxVisible = 3;

  static void show(
    String message, {
    required ToastType type,
    required Duration duration,
  }) {
    final overlayState = Overlay.of(router.navigatorKey.currentState!.context);

    // Remove oldest if limit exceeded
    if (_toasts.length >= _maxVisible) {
      _dismissAt(0);
    }

    final indexNotifier = ValueNotifier<int>(_toasts.length);

    late OverlayEntry entry;
    late _ToastDataModel data;

    entry = OverlayEntry(
      builder: (_) => _ToastWidget(
        message: message,
        type: type,
        duration: duration,
        indexNotifier: indexNotifier,
        onDismiss: () => _remove(data),
        onControllerReady: (controller) {
          data.animationController = controller;
        },
      ),
    );

    data = _ToastDataModel(entry: entry, indexNotifier: indexNotifier);
    _toasts.add(data);
    overlayState.insert(entry);
  }

  static void _dismissAt(int index) {
    if (index < 0 || index >= _toasts.length) return;
    final data = _toasts[index];
    data.animationController.reverse().then((_) {
      final i = _toasts.indexOf(data);
      if (i != -1) {
        data.entry.remove();
        data.indexNotifier.dispose();
        _toasts.removeAt(i);
        _updateIndices();
      }
    });
  }

  static void _remove(_ToastDataModel data) {
    data.animationController.reverse().then((_) {
      final index = _toasts.indexOf(data);
      if (index != -1) {
        data.entry.remove();
        data.indexNotifier.dispose();
        _toasts.removeAt(index);
        _updateIndices();
      }
    });
  }

  static void _updateIndices() {
    for (var i = 0; i < _toasts.length; i++) {
      _toasts[i].indexNotifier.value = i;
    }
  }
}

// ─── Toast Widget ─────────────────────────────────────────────────────────────

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;
  final ValueNotifier<int> indexNotifier;
  final VoidCallback onDismiss;
  final void Function(AnimationController) onControllerReady;

  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.indexNotifier,
    required this.onDismiss,
    required this.onControllerReady,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    widget.onControllerReady(_controller);
    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) widget.onDismiss();
    });

    // Error toasts must be dismissed manually
    // if (widget.type != ToastType.error) {
    //   Future.delayed(widget.duration, () {
    //     if (mounted) widget.onDismiss();
    //   });
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ── Style helpers ──────────────────────────────────────────────────────────

  Color _backgroundColor(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return switch (widget.type) {
      ToastType.success => const Color(0xFF2E7D32),
      ToastType.error => colors.error,
      ToastType.warning => const Color(0xFFE65100),
      ToastType.info => colors.primary,
    }.withAlpha(220);
  }

  Color _foregroundColor(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return switch (widget.type) {
      ToastType.success => Colors.white,
      ToastType.error => colors.onError,
      ToastType.warning => Colors.white,
      ToastType.info => colors.onPrimary,
    };
  }

  IconData get _icon => switch (widget.type) {
    ToastType.success => Icons.check_circle_outline_rounded,
    ToastType.error => Icons.error_outline_rounded,
    ToastType.warning => Icons.warning_amber_rounded,
    ToastType.info => Icons.info_outline_rounded,
  };

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.indexNotifier,
      builder: (_, index, _) {
        final topOffset =
            MediaQuery.of(context).padding.top + 16 + (index * 88.0);

        final bg = _backgroundColor(context);
        final fg = _foregroundColor(context);

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          top: topOffset,
          left: 16,
          right: 16,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(60),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(_icon, color: fg, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.message,
                          style: TextStyle(
                            color: fg,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onDismiss,
                        child: Icon(Icons.close_rounded, color: fg, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Data Model ───────────────────────────────────────────────────────────────

class _ToastDataModel {
  final OverlayEntry entry;
  final ValueNotifier<int> indexNotifier;
  late AnimationController animationController;

  _ToastDataModel({required this.entry, required this.indexNotifier});
}
