import 'package:flutter/material.dart';

import '../words/words.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? details;
  final String? message;

  const AppErrorWidget({super.key, this.details, this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const .all(20),
          child: Column(
            mainAxisSize: .min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                Words.happenError.str,
                style: const TextStyle(fontSize: 18, fontWeight: .bold),
              ),
              if (details != null) ...{
                const SizedBox(height: 8),
                Text(
                  details!.exceptionAsString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              },
              if (details == null && message != null) ...{
                const SizedBox(height: 8),
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
