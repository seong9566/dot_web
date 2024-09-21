import 'package:do_in_web/screen/default_layout.dart';
import 'package:do_in_web/screen/profile/bottom_nav/profile_bottom_nav.dart';
import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/screen/widget/banner_item.dart';
import 'package:do_in_web/screen/widget/swiper_card_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    debugPrint("Profile Screen build !!");
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
            SizedBox(
              width: 1340,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileVm.widgetDataList.length,
                  itemBuilder: (context, index) {
                    final widgetItem = profileVm.widgetDataList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 50, top: 50),
                      child: Builder(
                        builder: (context) {
                          switch (widgetItem.runtimeType) {
                            case SwiperCardWidget:
                              final swiperItem =
                                  widgetItem as SwiperCardWidget; // 타입 캐스팅
                              return SwiperCardWidget(
                                isEdit: false,
                                cardItem: swiperItem.cardItem,
                                itemLength: swiperItem.itemLength,
                              );
                            case BannerItem:
                              return BannerItem(
                                isEdit: false,
                              );
                            default:
                              return widgetItem; // 다른 위젯이 있을 경우 기본 값으로 처리
                          }
                        },
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
