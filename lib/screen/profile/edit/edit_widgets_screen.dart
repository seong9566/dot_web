import 'package:do_in_web/screen/profile/edit/profile_edit_view_model.dart';
import 'package:do_in_web/screen/profile/edit/widget/edit_widget_dialog.dart';
import 'package:flutter/material.dart';

import '../profile_view_model.dart';
import '../widget/swiper_card_widget.dart';

class EditWidgetsScreen extends StatefulWidget {
  const EditWidgetsScreen({super.key});

  @override
  State<EditWidgetsScreen> createState() => _EditWidgetsScreenState();
}

class _EditWidgetsScreenState extends State<EditWidgetsScreen> {
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
    profileEditVm.initDataList();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  void dispose() {
    profileVm.removeListener(listener!);
    profileEditVm.removeListener(listener!);
    listener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 모든 위젯 위에 무조건 Edit버튼 띄우기.
        // 1. 수정할 때 인덱스 값으로 어떤 위젯인지 찾음
        // 2. 위젯에 따라서 어떤 수정 창을 띄울지 결정함.
        ListView.builder(
          shrinkWrap: true,
          itemCount: profileEditVm.tempWidgetList.length,
          itemBuilder: (context, index) {
            final widgetItem = profileEditVm.tempWidgetList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 50, top: 50),
              child: widgetItem is SwiperCardWidget
                  ? SwiperCardWidget(
                      isEdit: widgetItem.isEdit,
                      cardItem: widgetItem.cardItem,
                      itemLength: widgetItem.itemLength,
                      deleteCallback: () {
                        profileEditVm.deleteWidget(index);
                      },
                      editCallback: () {
                        showSwiperEditDialog();
                        // profileVm.editSwiperCardWidget();
                      },
                    )
                  : widgetItem, // SwiperCardWidget이 아닌 경우 그대로 표시
            );
          },
        ),
      ],
    );
  }

  void showSwiperEditDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: EditWidgetDialog(),
          );
        });
  }
}
