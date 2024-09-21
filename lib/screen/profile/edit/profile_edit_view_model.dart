import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../../model/profile_image_card.dart';
import '../../widget/banner_item.dart';
import '../widget/swiper_card_widget.dart';
import 'data/general_widget_model.dart';

// 임시 Model과 완성된 Model이 필요.
class ProfileEditViewModel extends ChangeNotifier {
  ProfileEditViewModel._();

  static final ProfileEditViewModel _instance = ProfileEditViewModel._();

  factory ProfileEditViewModel() => _instance;

  // GeneralWidgetModel? selectedWidget;

  // 임시 저장할 List
  List<Widget> tempWidgetList = [];

  // 수정 완료 후 List -> ProfileViewModel에 공급 해줄 예정
  List<Widget> resultWidgetList = [];

  /*
  Bottom Nav 선택 함수
   */
  // Future<void> setSelectedItem(GeneralWidgetModel? item) async {
  //   if (selectedWidget != null) {
  //     selectedWidget = item;
  //     notifyListeners();
  //   }
  //   selectedWidget = item;
  //   debugPrint("_selectedWidget: $selectedWidget");
  //   notifyListeners();
  // }

  void initDataList() {
    resultWidgetList = ProfileViewModel().widgetDataList;
    tempWidgetList = resultWidgetList.map((widget) {
      // SwiperCardWidget인 경우 isEdit 값을 true로 변경하여 반환
      if (widget is SwiperCardWidget) {
        return SwiperCardWidget(
          isEdit: true, // isEdit 값을 true로 변경
          cardItem: widget.cardItem,
          itemLength: widget.itemLength,
          // 아래 두개 빼면 null 에러 발생, edit을 분리 시켜야하나..?
          deleteCallback: () {},
          editCallback: () {},
        );
      } else if (widget is BannerItem) {
        return BannerItem(isEdit: true);
      } else {
        return widget;
      }
    }).toList();
    debugPrint("editWidgetDataList: ${tempWidgetList}");
  }

  //
  void addWidgetItem(GeneralWidgetModel? item) {
    switch (item!.widgetName) {
      case "bannerWidget":
        tempWidgetList.add(BannerItem());
        item = null;
        break;
      case "sliderCard2":
        tempWidgetList.add(SwiperCardWidget(
          isEdit: false,
          cardItem: profileImageCardList,
          itemLength: profileImageCardList.length,
        ));
        item = null;
        break;
    }
    debugPrint("tempWidgetList: ${tempWidgetList.length}");
    notifyListeners();
  }

  // 위젯 수정 사항 저장
  Future<void> confirm() async {
    debugPrint(
        "ProfileViewModel().widgetDataList11: ${ProfileViewModel().widgetDataList.length}");
    resultWidgetList = tempWidgetList;
    ProfileViewModel().widgetDataList = resultWidgetList;
    tempWidgetList = [];
    debugPrint(
        "ProfileViewModel().widgetDataList22: ${ProfileViewModel().widgetDataList.length}");

    notifyListeners();
  }

  // 위젯 수정 사항 취소
  Future<void> cancel() async {
    tempWidgetList = [];
    resultWidgetList = [];
    notifyListeners();
  }
  // // 아이템 삭제
  // void deleteSelectedItems() {
  //   items.removeWhere((item) => selectedItems.contains(items.indexOf(item)));
  //   filteredItem.removeWhere((item) => selectedItems.contains(item));
  //   selectedItems.clear();
  //   print("Delete후 아이템 : ${filteredItem.length}");
  //   notifyListeners();
  // }
}
