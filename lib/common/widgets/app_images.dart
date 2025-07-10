import 'package:flutter/material.dart';

part 'app_images.res.dart';

/// To view images, to be easy to search
/// You can add any changes
void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AppImages: ${AppImages.list.length}")),
        body: ListView.separated(
          itemCount: AppImages.list.length,
          separatorBuilder: (_, i) => const Divider(height: 12),
          itemBuilder: (_, i) => Column(
            children: [
              Image.asset(
                AppImages.list[i],
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Text(AppImages.list[i], style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
