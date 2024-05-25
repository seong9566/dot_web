import 'package:do_in_web/screen/widget/animated_bottom_nav.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget page;

  DefaultLayout({required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      bottomNavigationBar: AnimatedBottomNavBar(),
      extendBody: true,
    );
  }
}
