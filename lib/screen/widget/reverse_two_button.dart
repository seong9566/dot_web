import 'package:do_in_web/screen/widget/widget_utils.dart';
import 'package:flutter/material.dart';

import 'package:do_in_web/common/import_util.dart';

class ReverseTwoButton extends StatefulWidget {
  final String leftTitle;
  final String rightTitle;
  final VoidCallback rightBtnCallback;
  const ReverseTwoButton(
      {super.key,
      required this.leftTitle,
      required this.rightTitle,
      required this.rightBtnCallback});

  @override
  State<ReverseTwoButton> createState() => _ReverseTwoButtonState();
}

class _ReverseTwoButtonState extends State<ReverseTwoButton> {
  double buttonWith = 156.0;
  double buttonHeight = 40.0;
  bool leftButtonClick = false;
  bool rightButtonClick = true;
  Color titleColor = ColorAssets.blackColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonItem(
          reversRadius: true,
          title: widget.leftTitle,
          callback: () {
            Navigator.pop(context);
          },
          titleColor: titleColor,
          backgroundColor: ColorAssets.greyColor,
        ),
        ...twoBottomNavDot(color: ColorAssets.greyColor),
        buttonItem(
          reversRadius: false,
          title: widget.rightTitle,
          callback: widget.rightBtnCallback.call,
          titleColor: titleColor,
          backgroundColor: ColorAssets.greenColor,
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
        width: buttonWith,
        height: buttonHeight,
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
