import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RootLayout extends HookWidget {
  final HookWidget screen;

  RootLayout({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screen,
      ),
    );
  }
}
