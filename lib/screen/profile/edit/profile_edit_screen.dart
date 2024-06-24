import 'package:do_in_web/screen/default_layout.dart';
import 'package:do_in_web/screen/profile/edit/edit_contents_screen.dart';
import 'package:do_in_web/screen/profile/edit/edit_widgets_screen.dart';
import 'package:do_in_web/screen/profile/bottom_nav/profile_contents_bottom_nav.dart';
import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/screen/profile/bottom_nav/profile_widget_bottom_nav.dart';
import 'package:do_in_web/screen/profile/widget/swiper_card_widget.dart';
import 'package:do_in_web/screen/widget/widget_utils.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final ProfileViewModel profileVm = ProfileViewModel();
  Function()? listener;

  bool isWidgetBtnClick = true;
  bool isContentsBtnClick = false;

  double widgetAndContentsWidget = 156.0;
  double widgetAndContentsHeight = 40.0;

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
    return Scaffold(
      body: _body(),
      bottomNavigationBar: isContentsBtnClick
          ? ProfileContentsBottomNav()
          : ProfileWidgetBottomNav(),
      extendBody: true,
    );
  }

  Widget _body() {
    Widget body;
    if (isContentsBtnClick) {
      body = EditContentsScreen();
    } else {
      body = EditWidgetsScreen();
    }

    return DefaultLayout(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 116),
            widgetAndContentBtn(),
            body,
          ],
        ),
      ),
    );
  }

  Widget widgetAndContentBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonItem(
          reversRadius: true,
          title: "Widgets",
          callback: () {
            setState(() {
              isWidgetBtnClick = !isWidgetBtnClick;
              isContentsBtnClick = !isContentsBtnClick;
            });
          },
          titleColor: isWidgetBtnClick
              ? ColorAssets.whiteColor
              : ColorAssets.blackColor,
          backgroundColor: isWidgetBtnClick
              ? ColorAssets.primaryColor
              : ColorAssets.greyColor,
        ),
        ...twoBottomNavDot(color: ColorAssets.greyColor),
        buttonItem(
          reversRadius: false,
          title: "Contents",
          callback: () {
            setState(() {
              isContentsBtnClick = !isContentsBtnClick;
              isWidgetBtnClick = !isWidgetBtnClick;
            });
          },
          titleColor: isContentsBtnClick
              ? ColorAssets.whiteColor
              : ColorAssets.blackColor,
          backgroundColor: isContentsBtnClick
              ? ColorAssets.primaryColor
              : ColorAssets.greyColor,
        ),
      ],
    );
  }

  Widget buttonItem({
    required bool reversRadius,
    required String title,
    required VoidCallback callback,
    required Color backgroundColor,
    required Color titleColor,
  }) {
    final BorderRadius _radius;
    if (reversRadius) {
      _radius = const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      );
    } else {
      _radius = const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      );
    }
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: widgetAndContentsWidget,
        height: widgetAndContentsHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: _radius,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
