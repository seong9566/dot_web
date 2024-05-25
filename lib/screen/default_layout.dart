import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget page;

  const DefaultLayout({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }
}
