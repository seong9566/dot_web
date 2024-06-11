import 'package:do_in_web/screen/widget/animated_bottom_nav.dart';
import 'package:do_in_web/screen/widget/banner_item.dart';
import 'package:do_in_web/screen/widget/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: AnimatedBottomNavBar(),
      extendBody: true,
    );
  }

  Widget _body() {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            SearchField(leftIcon: false),
            SizedBox(height: 80),
            BannerItem(),
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
