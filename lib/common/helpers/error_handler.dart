import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/themes.dart';
import '../words/words.dart';

class ErrorHelper {
  const ErrorHelper._();

  static String getErrorStr(dynamic e) {
    if (kDebugMode) {
      print(StackTrace.current);
    }

    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.data is Map && e.response!.data['message'] != null) {
          return '${e.response!.statusCode}:${e.response!.data['message']}';
        }
        return '${e.response!.statusCode}: ${e.response!.statusMessage}\n${e.response!.data}';
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return Words.noInternet.str;

        default:
          return '$e';
      }
    }
    return '$e';
  }

  static void showError(String message) {
    _ErrorNotificationService.show(message);
  }
}

class _ErrorNotificationService {
  const _ErrorNotificationService._();

  static final List<_ErrorDataModel> _notifications = [];
  static const _maxVisible = 3;

  static void show(String message) {
    final context = router.navigatorKey.currentContext;
    if (context == null) {
      return;
    }

    if (_notifications.length >= _maxVisible) {
      _notifications.first.animationController.reverse().then((_) {
        _notifications.first.entry.remove();
        _notifications.removeAt(0);
        _updateIndices();
      });
    }

    final indexNotifier = ValueNotifier<int>(_notifications.length);
    final overlayState = Overlay.of(context);

    late OverlayEntry entry;
    late _ErrorDataModel data;

    entry = OverlayEntry(
      builder: (context) => _ErrorPage(
        message: message,
        indexNotifier: indexNotifier,
        onDismiss: () => _remove(data),
        onControllerReady: (controller) {
          data.animationController = controller;
        },
      ),
    );

    data = _ErrorDataModel(entry: entry, indexNotifier: indexNotifier);
    _notifications.add(data);
    overlayState.insert(entry);
  }

  static void _remove(_ErrorDataModel data) {
    data.animationController.reverse().then((_) {
      final index = _notifications.indexOf(data);
      if (index != -1) {
        data.entry.remove();
        _notifications.removeAt(index);
        _updateIndices();
      }
    });
  }

  static void _updateIndices() {
    for (var i = 0; i < _notifications.length; i++) {
      _notifications[i].indexNotifier.value = i;
    }
  }
}

class _ErrorPage extends StatefulWidget {
  final String message;
  final ValueNotifier<int> indexNotifier;
  final VoidCallback onDismiss;
  final Function(AnimationController) onControllerReady;

  const _ErrorPage({
    required this.message,
    required this.indexNotifier,
    required this.onDismiss,
    required this.onControllerReady,
  });

  @override
  State<_ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<_ErrorPage>
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return ValueListenableBuilder<int>(
      valueListenable: widget.indexNotifier,
      builder: (_, index, _) {
        final topOffset =
            MediaQuery.of(context).padding.top + 16 + (index * 88.0);

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
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.error.withAlpha(210),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colors.onError,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onDismiss,
                      icon: Icon(Icons.close, color: colors.onError),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ErrorDataModel {
  final OverlayEntry entry;
  final ValueNotifier<int> indexNotifier;
  late AnimationController animationController;

  _ErrorDataModel({required this.entry, required this.indexNotifier});
}
