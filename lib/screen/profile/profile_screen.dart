import 'package:do_in_web/screen/default_layout.dart';
import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/screen/profile/widget/profile_bottom_nav.dart';
import 'package:do_in_web/screen/profile/widget/swiper_card_widget.dart';
import 'package:flutter/material.dart';

import '../widget/search_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel profileVm = ProfileViewModel();
  Function()? listener;

  @override
  void initState() {
    if (mounted) {
      listener = () {
        setState(() {});
      };
    }
    profileVm.addListener(listener!);
    super.initState();
  }

  @override
  void dispose() {
    profileVm.removeListener(listener!);
    listener = null;
    super.dispose();
  }

  bool isButtonVisible() {
    if (profileVm.profileImageCardList.length > 4) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: ProfileBottomNav(),
      //TODO: extendBody:true 해주지 않으면 bottomNav가 화면 전체 영역을 엎음.
      extendBody: true,
    );
  }

  Widget _body() {
    return DefaultLayout(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 80),
            SearchField(
              leftIcon: true,
              callback: () {
                print("프로필 아이콘 클릭");
              },
            ),
            const SizedBox(height: 80),
            SwiperCardWidget(
              isEdit: false,
              cardItem: profileVm.profileImageCardList,
              isButtonVisible: isButtonVisible(),
            ),
            const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
