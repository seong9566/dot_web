import 'package:do_in_web/screen/profile/edit/data/dumy_contents.dart';
import 'package:do_in_web/screen/profile/widget/swiper_card_widget.dart';
import 'package:do_in_web/screen/widget/banner_item.dart';
import 'package:flutter/cupertino.dart';

import '../../model/profile_image_card.dart';
import 'edit/data/general_widget_model.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel._();
  static final ProfileViewModel _instance = ProfileViewModel._();
  factory ProfileViewModel() => _instance;

  List<DumyContents> filteredItem = [];

  final List<DumyContents> items = contentsList;
  List<String> typeList = ["Type"];
  List<String> widgetNameList = ["All Widgets"];
  List<String> tagList = ["Tags"];
  List<String> dateList = ["Date", "최신순", "오래된 순"];

  List<Widget> widgetDataList = [
    SwiperCardWidget(
      isEdit: false,
      cardItem: profileImageCardList,
      itemLength: profileImageCardList.length,
    )
  ];

  bool get isAllChecked => selectedItems.length == items.length;
  Set<DumyContents> selectedItems = {};

  GeneralWidgetModel? _selectedWidget;

  GeneralWidgetModel? get selectedWidget => _selectedWidget;

  void setSelectedItem(GeneralWidgetModel? item) {
    if (_selectedWidget != null) {
      _selectedWidget = item;
      notifyListeners();
    }
    _selectedWidget = item;
    notifyListeners();
  }

  void addWidgetItem() {
    switch (_selectedWidget!.widgetName) {
      case "bannerWidget":
        widgetDataList.add(BannerItem());
        _selectedWidget = null;
        break;
      case "sliderCard2":
        widgetDataList.add(SwiperCardWidget(
          isEdit: false,
          cardItem: profileImageCardList,
          itemLength: profileImageCardList.length,
        ));
        _selectedWidget = null;
        break;
    }
    notifyListeners();
  }

  void toggleAllSelection(bool isSelected) {
    if (isSelected) {
      selectedItems = items.toSet();
    } else {
      selectedItems.clear();
    }
    notifyListeners();
  }

  void toggleSelection(DumyContents item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  Future<void> moveSelectedItems() async {
    // 선택된 아이템 이동 로직 구현
    print(
        "moveSelectedItems: ${selectedItems.map((item) => item.title).toList()}");
    items.removeWhere((item) => selectedItems.contains(items.indexOf(item)));
    filteredItem.removeWhere((item) => selectedItems.contains(item));
    selectedItems.clear();
    notifyListeners();
  }

  void deleteSelectedItems() {
    print("delete items: ${selectedItems.map((item) => item.title).toList()}");
    print("Delete전 아이템 : ${filteredItem.length}");
    items.removeWhere((item) => selectedItems.contains(items.indexOf(item)));
    filteredItem.removeWhere((item) => selectedItems.contains(item));
    selectedItems.clear();
    print("Delete후 아이템 : ${filteredItem.length}");
    notifyListeners();
  }

  void setContentsBarItems({required List<DumyContents> contentsList}) {
    typeList.addAll(
        contentsList.map((content) => content.type.type).toSet().toList());
    widgetNameList.addAll(
        contentsList.map((content) => content.widgetName).toSet().toList());
    tagList.addAll(
        contentsList.expand((content) => content.tags).toSet().toList());
  }

  Future<void> init() async {
    setContentsBarItems(contentsList: contentsList);
    defaultFilter();
  }

  void defaultFilter() async {
    filteredItem = items;
  }

  void checkFilter() {}

  void widgetMove() {}
}
