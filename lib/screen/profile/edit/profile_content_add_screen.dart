import 'package:flutter/material.dart';

import '../bottom_nav/profile_content_add_bottom_nav.dart';

class ProfileContentAddScreen extends StatefulWidget {
  const ProfileContentAddScreen({super.key});

  @override
  State<ProfileContentAddScreen> createState() =>
      _ProfileContentAddScreenState();
}

class _ProfileContentAddScreenState extends State<ProfileContentAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProfileContentAddBottomNav(),
      extendBody: true,
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 158),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            inputTitleField(),
          ],
        ),
      ),
    );
  }

  Widget inputTitleField() {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
