import 'package:do_in_web/common/import_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/widget_utils.dart';

class ResultDialog {
  // 체크 버튼
  void showConfirmDialog(BuildContext context, VoidCallback confirm) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 800,
            height: 400,
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  '변경 사항을 저장 하시겠습니까?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: ColorAssets.greenColor,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultButton(
                      reversRadius: true,
                      title: "CANCEL",
                      callback: () {
                        Navigator.pop(context);
                      },
                      titleColor: ColorAssets.blackColor,
                      backgroundColor: ColorAssets.greyColor,
                    ),
                    ...twoBottomNavDot(color: ColorAssets.greyColor),
                    defaultButton(
                      reversRadius: false,
                      title: "CONFIRM",
                      callback: confirm,
                      titleColor: ColorAssets.blackColor,
                      backgroundColor: ColorAssets.greenColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  // 엑스 버튼
  void showCancelDialog(BuildContext context, VoidCallback confirm) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 800,
            height: 400,
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  '변경된 사항이 저장되지 않습니다.\n이 페이지를 벗어 나시겠습니까?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: ColorAssets.cancelButtonColor,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultButton(
                      reversRadius: true,
                      title: "CANCEL",
                      callback: () {
                        Navigator.pop(context);
                      },
                      titleColor: ColorAssets.blackColor,
                      backgroundColor: ColorAssets.greyColor,
                    ),
                    ...twoBottomNavDot(color: ColorAssets.greyColor),
                    defaultButton(
                      reversRadius: false,
                      title: "OK",
                      callback: confirm,
                      titleColor: ColorAssets.blackColor,
                      backgroundColor: ColorAssets.cancelButtonColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
