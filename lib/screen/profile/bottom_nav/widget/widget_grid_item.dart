import 'package:flutter/material.dart';

import '../../../../util/color_assets.dart';
import '../../edit/data/general_widget_model.dart';

class WidgetGridItem extends StatefulWidget {
  final GeneralWidgetModel model;
  final bool isSelected;
  final VoidCallback onTap;
  const WidgetGridItem(
      {super.key,
      required this.model,
      required this.isSelected,
      required this.onTap});

  @override
  State<WidgetGridItem> createState() => _WidgetGridItemState();
}

class _WidgetGridItemState extends State<WidgetGridItem> {
  bool _isHovered = false;
  bool isSelected = false;
  void gridViewItemOnEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  void selectedItem() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedItem();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
              if (_isHovered || isSelected)
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
