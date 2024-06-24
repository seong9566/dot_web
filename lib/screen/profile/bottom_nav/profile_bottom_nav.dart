import 'package:do_in_web/screen/widget/widget_utils.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ProfileBottomNav extends StatefulWidget {
  @override
  _ProfileBottomNavState createState() => _ProfileBottomNavState();
}

class _ProfileBottomNavState extends State<ProfileBottomNav> {
  double _height = 80.0; // 초기 높이
  double _width = 656;
  bool onHover = false;

  double _bottomPadding = 6.0;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(bottom: 20, left: _width, right: _width),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) => setState(() {
          _height = 526.0;
          _width = 924.0;
          onHover = true;
        }), // 마우스를 올렸을 때 높이 변경
        onExit: (PointerExitEvent event) => setState(() {
          _height = 80.0;
          _width = 656.0;
          onHover = false;
        }), // 마우스를 내렸을 때 높이 변경
        child: AnimatedContainer(
          margin: const EdgeInsets.only(bottom: 20),
          height: _height,
          width: _width,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: ColorAssets.bottomNavColor.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 6,
                left: 6,
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: onHover ? 908 : 0,
                  height: onHover ? 422 : 0,
                  // width: 908,
                  // height: 422,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _button("메인 페이지", () {}),
                      SizedBox(height: 40),
                      _button("그룹 게시판", () {}),
                    ],
                  ),
                ),
              ),
              communityButton(),
              bottomNavItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String title, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color: ColorAssets.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(0, 0),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: ColorAssets.blackColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavItems() {
    return Positioned(
      bottom: _bottomPadding,
      right: 8,
      child: Row(
        children: [
          ...twoBottomNavDot(color: ColorAssets.whiteColor),
          bottomNavItem(
            const Icon(
              CupertinoIcons.bell,
              size: 40,
            ),
            () {},
          ),
          ...twoBottomNavDot(color: ColorAssets.whiteColor),
          bottomNavItem(
            const Icon(
              CupertinoIcons.mail,
              size: 40,
            ),
            () {},
          ),
          ...twoBottomNavDot(color: ColorAssets.whiteColor),
          bottomNavItem(
            const Icon(
              CupertinoIcons.bookmark,
              size: 40,
            ),
            () {},
          ),
          ...twoBottomNavDot(color: ColorAssets.whiteColor),
          bottomNavItem(
            Image.asset("assets/bottom_nav/icon_setting.png"),
            () {
              GoRouter.of(context).goNamed("profile_edit");
              // Navigator.push(context, ProfileEditScreen());
              // context.goNamed('profile_edit');
            },
          )
        ],
      ),
    );
  }

  // 하단 네비게이션 아이템
  Widget bottomNavItem(Widget icon, VoidCallback call) {
    return GestureDetector(
      onTap: call,
      child: Container(
        width: 68,
        height: 68,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  Widget communityButton() {
    return Positioned(
      bottom: _bottomPadding,
      left: 8,
      child: GestureDetector(
        onTap: () {
          print("communityButton Clicked");
        },
        child: Container(
          width: 288,
          height: 68,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Center(
            child: Text(
              "Community",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: ColorAssets.bottomNavEditBtnColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Bottom Nav 내부 탭 버튼 요소들
   */
  Widget tabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tabButton(() {
          print("ALL 클릭");
        }, "ALL"),
        tabButton(() {}, "SMS"),
        tabButton(() {}, "ACTIVITY"),
        tabButton(() {}, "SYSTEM"),
      ],
    );
  }

  Widget tabButton(VoidCallback call, String text) {
    TextStyle btnStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorAssets.bottomNavEditBtnColor,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(
          color: ColorAssets.bottomNavEditBtnColor,
          width: 2,
        ),
      )),
      child: TextButton(
        onPressed: call,
        child: Text(
          text,
          style: btnStyle,
        ),
      ),
    );
  }
}
