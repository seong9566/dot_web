import 'package:do_in_web/model/chat_model.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../profile_view_model.dart';

class ProfileContentsBottomNav extends StatefulWidget {
  @override
  _ProfileContentsBottomNavState createState() =>
      _ProfileContentsBottomNavState();
}

class _ProfileContentsBottomNavState extends State<ProfileContentsBottomNav> {
  double _height = 80.0; // 초기 높이
  double _width = 480.0;
  double _clickHeight = 232.0;
  double _clickWidth = 480;
  bool onHover = false;
  bool isWidgetOnEnter = false;
  bool isPageOnEnter = false;
  double _bottomPadding = 6.0;

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
    return Align(
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(bottom: 20, left: _width, right: _width),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) => setState(() {
          _height = _clickHeight;
          _width = _clickWidth;
          onHover = true;
        }), // 마우스를 올렸을 때 높이 변경
        onExit: (PointerExitEvent event) => setState(() {
          _height = 80.0;
          _width = 480.0;
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
              afterHover(),
              widgetAndPageBtn(),
              bottomNavItems(),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedPositioned afterHover() {
    return AnimatedPositioned(
      top: 6,
      left: 6,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: onHover ? 480 - 12 : 0,
        height: onHover ? 146 : 0,
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
    );
  }

  Widget _button(String title, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: ColorAssets.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
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
          ...bottomNavDot(),
          bottomNavItem(
            Image.asset("assets/bottom_nav/trash.png"),
            () {
              profileVm.deleteSelectedItems();
            },
          ),
          ...bottomNavDot(),
          bottomNavItem(
            Image.asset("assets/bottom_nav/add.png"),
            () {},
          ),
        ],
      ),
    );
  }

  List<Widget> bottomNavDot() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 4,
        height: 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 4,
        height: 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ];
  }

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

  Widget widgetAndPageBtn() {
    return Positioned(
      bottom: _bottomPadding,
      left: 8,
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
          child: GestureDetector(
            onTap: () {
              profileVm.moveSelectedItems();
            },
            child: MouseRegion(
              onEnter: (PointerEnterEvent event) => setState(() {
                isWidgetOnEnter = !isWidgetOnEnter;
              }),
              onExit: (PointerExitEvent event) => setState(() {
                isWidgetOnEnter = !isWidgetOnEnter;
              }),
              child: Text(
                "Widget Move",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: isWidgetOnEnter
                      ? ColorAssets.primaryColor
                      : ColorAssets.blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
