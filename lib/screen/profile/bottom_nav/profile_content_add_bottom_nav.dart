import 'package:do_in_web/screen/widget/dot_dialog.dart';
import 'package:do_in_web/common/import_util.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../profile_view_model.dart';

class ProfileContentAddBottomNav extends StatefulWidget {
  const ProfileContentAddBottomNav({super.key});

  @override
  _ProfileContentAddBottomNavState createState() =>
      _ProfileContentAddBottomNavState();
}

class _ProfileContentAddBottomNavState
    extends State<ProfileContentAddBottomNav> {
  double _height = 80.0;
  double _width = 480.0;
  bool onHover = false;
  bool isWidgetOnEnter = false;
  bool isPageOnEnter = false;
  double _bottomPadding = 6.0;

  final ProfileViewModel profileVm = ProfileViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(bottom: 20, left: _width, right: _width),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          color: ColorAssets.bottomNavColor.withOpacity(0.9),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: Stack(
          children: [
            mainButton(),
            bottomNavItems(deleteCallback: () {
              profileVm.deleteSelectedItems();
            }, addCallback: () {
              context.goNamed("profile_content_add");
            }),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItems(
      {required VoidCallback deleteCallback,
      required VoidCallback addCallback}) {
    return Positioned(
      bottom: _bottomPadding,
      right: 8,
      child: Row(
        children: [
          ...bottomNavDot(),
          bottomNavItem(
            Image.asset("assets/bottom_nav/trash.png"),
            deleteCallback,
          ),
          ...bottomNavDot(),
          bottomNavItem(
            Image.asset("assets/bottom_nav/icon_confirm.png"),
            addCallback,
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

  Widget mainButton() {
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
              // profileVm.moveSelectedItems();
              DotDialog().showMoveContentsDialog(
                  context, profileVm.selectedItems.length);
            },
            child: MouseRegion(
              onEnter: (PointerEnterEvent event) => setState(() {
                isWidgetOnEnter = !isWidgetOnEnter;
              }),
              onExit: (PointerExitEvent event) => setState(() {
                isWidgetOnEnter = !isWidgetOnEnter;
              }),
              child: Text(
                "Add Contents",
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
