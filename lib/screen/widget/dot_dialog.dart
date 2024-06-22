import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/screen/widget/reverse_two_button.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DotDialog {
  Future<Object?> showMoveContentsDialog(
      BuildContext context, int selectedCount) {
    final List<String> moveWidgetList = ["기본 갤러리 위젯", "위젯1", "위젯2", "위젯3"];
    String selectedWidget = moveWidgetList.first;
    return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "Barrier",
        context: context,
        //dialog가 내려오는 속도
        transitionDuration: const Duration(milliseconds: 300),
        // dialog Animation
        transitionBuilder: (_, animation, __, child) {
          Tween<Offset> tween;
          //Offset x: 0, y :-1 즉 위에서 시작해 원상태(zero) 까지.
          //만약 1,-1 이라면 오른쪽 위에서 나온다.
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
          //slide Animation
          return SlideTransition(
            position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
        pageBuilder: (context, _, __) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return Center(
                child: Container(
                  width: 800,
                  height: 400,
                  decoration: BoxDecoration(
                    color: ColorAssets.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Container(
                      padding: EdgeInsets.symmetric(horizontal: 134),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contents 이동",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: ColorAssets.blackColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "선택한 $selectedCount개의 Contents를 어느 위젯으로 옮기겠습니까?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorAssets.blackColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownButton2<String>(
                            underline: SizedBox.shrink(),
                            isExpanded: true,
                            value: selectedWidget,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedWidget = newValue!;
                              });
                            },
                            items: moveWidgetList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            buttonStyleData: ButtonStyleData(
                              width: 532,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      ColorAssets.blackColor.withOpacity(0.1),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 9,
                                    offset: Offset(0, 3), // 그림자의 위치 조정
                                  ),
                                ],
                              ),
                              elevation: 2,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              width: 532,
                              decoration: BoxDecoration(
                                color: ColorAssets.whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ReverseTwoButton(
                            leftTitle: "CANCEL",
                            rightTitle: "CONFIRM",
                            rightBtnCallback: () async {
                              await ProfileViewModel().moveSelectedItems();
                              Navigator.pop(context);
                              print("CONFIRM버튼 클릭");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
