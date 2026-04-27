import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:ddd_clean_template/common/widgets/app_shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideo extends StatefulWidget {
  final dynamic video; // String (URL or 'assets/...') or File
  final double? width;
  final double? height;
  final double? aspectRatio;
  final bool autoPlay;
  final bool muted;
  final bool looping;
  final bool showControls;

  const AppVideo(
    this.video, {
    super.key,
    this.width,
    this.height,
    this.aspectRatio,
    this.autoPlay = false,
    this.muted = false,
    this.looping = false,
    this.showControls = true,
  });

  @override
  State<AppVideo> createState() => _AppVideoState();
}

class _AppVideoState extends State<AppVideo> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void didUpdateWidget(covariant AppVideo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.video != widget.video) {
      _disposeControllers();
      setState(() => _error = null);
      _initialize();
    }
  }

  Future<void> _initialize() async {
    try {
      final controller = _buildVideoController();
      if (controller == null) {
        setState(() => _error = 'Invalid video source');
        return;
      }

      _videoController = controller;
      await controller.initialize();
      if (widget.muted) {
        await controller.setVolume(0);
      }

      if (!mounted) {
        controller.dispose();
        return;
      }

      _chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        showControls: widget.showControls,
        aspectRatio: widget.aspectRatio ?? controller.value.aspectRatio,
        allowFullScreen: true,
        allowMuting: true,
      );

      setState(() {});
    } catch (e) {
      setState(() => _error = '$e');
    }
  }

  VideoPlayerController? _buildVideoController() {
    final source = widget.video;
    if (source is File) {
      return VideoPlayerController.file(source);
    }
    if (source is String) {
      if (source.isEmpty) return null;
      if (source.startsWith('assets/')) {
        return VideoPlayerController.asset(source);
      }
      final uri = Uri.tryParse(source);
      if (uri == null || !uri.hasScheme) return null;
      return VideoPlayerController.networkUrl(uri);
    }
    return null;
  }

  void _disposeControllers() {
    _chewieController?.dispose();
    _videoController?.dispose();
    _chewieController = null;
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return AppVideoError(
        width: widget.width,
        height: widget.height,
        error: _error,
      );
    }

    final chewie = _chewieController;
    if (chewie == null) {
      return AppVideoLoading(width: widget.width, height: widget.height);
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Chewie(controller: chewie),
    );
  }
}

class AppVideoLoading extends StatelessWidget {
  final double? width;
  final double? height;

  const AppVideoLoading({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) =>
      AppShimmerText(width: width, height: height);
}

class AppVideoError extends StatelessWidget {
  final double? width;
  final double? height;
  final String? error;

  const AppVideoError({super.key, this.width, this.height, this.error});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface.withAlpha(120),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        ),
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam_off_outlined,
              size: 40,
              color: colorScheme.onSurfaceVariant,
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  error!,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
