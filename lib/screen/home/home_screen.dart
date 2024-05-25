import 'package:do_in_web/screen/widget/banner_item.dart';
import 'package:do_in_web/screen/widget/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              SearchField(),
              SizedBox(height: 80),
              BannerItem(),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
