import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'app_icons.res.dart';

/// To view images, to be easy to search
/// You can add any changes
void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('AppIcons: ${AppIcons.list.length}')),
      body: ListView.separated(
        itemCount: AppIcons.list.length,
        separatorBuilder: (_, i) => const Divider(height: 12),
        itemBuilder: (_, i) => Column(
          children: [
            SvgPicture.asset(AppIcons.list[i], height: 100),
            Text(AppIcons.list[i], style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    ),
  );
}
