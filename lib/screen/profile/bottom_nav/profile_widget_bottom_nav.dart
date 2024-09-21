import 'package:do_in_web/screen/profile/bottom_nav/widget/widget_grid_item.dart';
import 'package:do_in_web/screen/profile/edit/profile_edit_view_model.dart';
import 'package:do_in_web/screen/profile/edit/widget/result_dialog.dart';
import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/common/import_util.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../edit/data/general_widget_model.dart';

class ProfileWidgetBottomNav extends StatefulWidget {
  @override
  _ProfileWidgetBottomNavState createState() => _ProfileWidgetBottomNavState();
}

class _ProfileWidgetBottomNavState extends State<ProfileWidgetBottomNav> {
  final List<GeneralWidgetModel> widgetList = [
    GeneralWidgetModel(
        widgetName: "bannerWidget",
        captureWidget: "assets/widget_image/widget_banner.png"),
    GeneralWidgetModel(
        widgetName: "sliderCard",
        captureWidget: "assets/widget_image/widget_slider_card.png"),
    GeneralWidgetModel(
        widgetName: "sliderCard2",
        captureWidget: "assets/widget_image/widget_slider_card_2.png"),
    GeneralWidgetModel(
        widgetName: "bannerWidget",
        captureWidget: "assets/widget_image/widget_banner.png"),
    GeneralWidgetModel(
        widgetName: "sliderCard",
        captureWidget: "assets/widget_image/widget_slider_card.png"),
    GeneralWidgetModel(
        widgetName: "sliderCard2",
        captureWidget: "assets/widget_image/widget_slider_card_2.png"),
  ];

  double _height = 80.0; // 초기 높이
  double _width = 480.0;
  double _clickHeight = 600.0;
  double _clickWidth = 1288.0;
  bool bottomNavOnHover = false;
  bool isWidgetOnEnter = false;
  bool isPageOnEnter = false;
  double _bottomPadding = 6.0;

  final ProfileViewModel profileVm = ProfileViewModel();
  final ProfileEditViewModel profileEditVm = ProfileEditViewModel();
  Function()? listener;

  @override
  void initState() {
    if (mounted) {
      listener = () {
        setState(() {});
      };
    }
    profileEditVm.addListener(listener!);
    profileVm.addListener(listener!);
    super.initState();
  }

  @override
  void dispose() {
    profileEditVm.removeListener(listener!);
    profileVm.removeListener(listener!);
    listener = null;
    super.dispose();
  }

  void onEnter() {
    setState(() {
      _height = _clickHeight;
      _width = _clickWidth;
      bottomNavOnHover = true;
    });
  }

  void onExit() {
    setState(() {
      _height = 80.0;
      _width = 480.0;
      bottomNavOnHover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(bottom: 20, left: _width, right: _width),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) => onEnter(), // 마우스를 올렸을 때 높이 변경
        onExit: (PointerExitEvent event) => onExit(), // 마우스를 내렸을 때 높이 변경
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
              _body(),
              widgetAndPageBtn(),
              bottomNavItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    const double onHoverWidth = 1272.0;
    const double onHoverHeight = 514.0;
    return AnimatedPositioned(
      top: 6,
      left: 6,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: bottomNavOnHover ? onHoverWidth : 0,
        height: bottomNavOnHover ? onHoverHeight : 0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectWidgetBtn(),
            _gridView(bottomNavOnHover),
          ],
        ),
      ),
    );
  }

  Widget _gridView(bool bottomNavOnHover) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 470,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 349 / 240),
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          return WidgetGridItem(
            bottomNavOnHover: bottomNavOnHover,
            model: widgetList[index],
            // isSelected: profileEditVm.selectedWidget == widgetList[index],
            onTap: () async {
              profileEditVm.addWidgetItem(widgetList[index]);
              // profileEditVm.setSelectedItem();
            },
          );
        },
      ),
    );
  }

  Widget _selectWidgetBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "GENERAL WIDGET",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorAssets.primaryColor),
        ),
        const SizedBox(width: 10),
        VerticalDivider(
          width: 3,
          color: ColorAssets.primaryColor,
        ),
        const SizedBox(width: 10),
        Text(
          "PRO-WIDGETS",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorAssets.primaryColor),
        )
      ],
    );
  }

  Widget bottomNavItems() {
    return Positioned(
      bottom: _bottomPadding,
      right: 8,
      child: Row(
        children: [
          bottomNavItem(
            Image.asset("assets/bottom_nav/icon_cancel.png"),
            () {
              ResultDialog().showCancelDialog(context, () async {
                await profileEditVm.cancel();
                if (mounted) {
                  context.pop();
                  context.pushReplacementNamed("profile");
                }
              });
            },
          ),
          const SizedBox(width: 20),
          bottomNavItem(
            Image.asset("assets/bottom_nav/icon_confirm.png"),
            () async {
              ResultDialog().showConfirmDialog(context, () async {
                await profileEditVm.confirm();
                if (mounted) {
                  context.pop();
                  context.pushReplacementNamed("profile");
                }
              });
            },
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) => setState(() {
                    isWidgetOnEnter = !isWidgetOnEnter;
                  }),
                  onExit: (PointerExitEvent event) => setState(() {
                    isWidgetOnEnter = !isWidgetOnEnter;
                  }),
                  child: Text(
                    "Widget",
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: VerticalDivider(
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) => setState(() {
                    isPageOnEnter = !isPageOnEnter;
                  }),
                  onExit: (PointerExitEvent event) => setState(() {
                    isPageOnEnter = !isPageOnEnter;
                  }),
                  child: Text(
                    "Page",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: isPageOnEnter
                          ? ColorAssets.primaryColor
                          : ColorAssets.blackColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
