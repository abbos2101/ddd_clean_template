import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('$this')));
}
