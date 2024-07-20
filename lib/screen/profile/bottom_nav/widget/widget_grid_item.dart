import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:flutter/material.dart';

import 'package:do_in_web/common/import_util.dart';

import '../../edit/data/general_widget_model.dart';

class WidgetGridItem extends StatefulWidget {
  final GeneralWidgetModel model;
  final bool isSelected;
  final VoidCallback onTap;
  final bool bottomNavOnHover;
  const WidgetGridItem(
      {super.key,
      required this.model,
      required this.isSelected,
      required this.onTap,
      required this.bottomNavOnHover});

  @override
  State<WidgetGridItem> createState() => _WidgetGridItemState();
}

class _WidgetGridItemState extends State<WidgetGridItem> {
  late bool _isHovered;
  late bool _isSelected;
  ProfileViewModel vm = ProfileViewModel();
  Function()? listener;

  @override
  void initState() {
    if (mounted) {
      listener = () {
        setState(() {});
      };
    }
    vm.addListener(listener!);
    _isHovered = false;
    _isSelected = false;
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  // 아이템 Hover
  void gridViewItemOnEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  // 아이템 선택
  void selectedItem() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onTap();
  }

  // BottomNav가 닫히면 초기화
  Future<void> setDefault() async {
    _isHovered = false;
    _isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.bottomNavOnHover) {
      setDefault();
    }
    return GestureDetector(
      onTap: () {
        selectedItem();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 470,
        child: MouseRegion(
          onEnter: (event) => gridViewItemOnEnter(true),
          onExit: (event) => gridViewItemOnEnter(false),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorAssets.whiteColor,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5), // 연한 회색 테두리 색상
                    width: 1.0, // 테두리 두께
                  ),
                ),
                child: Center(
                  child: Image.asset(widget.model.captureWidget),
                ),
              ),
              if (_isHovered || (vm.selectedWidget == widget.model))
                Container(
                  color: ColorAssets.primaryColor.withOpacity(0.2), // 보라색 오버레이
                ),
            ],
          ),
        ),
      ),
    );
  }
}
