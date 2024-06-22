import 'package:do_in_web/screen/profile/edit/data/dumy_contents.dart';
import 'package:flutter/cupertino.dart';

import '../../model/profile_image_card.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel._();
  static final ProfileViewModel _instance = ProfileViewModel._();
  factory ProfileViewModel() => _instance;

  List<DumyContents> filteredItem = [];
  /*
  * 새로 추가된 부분
  * */

  bool get isAllChecked => selectedItems.length == items.length;
  Set<DumyContents> selectedItems = {};
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

  void moveSelectedItems() {
    // 선택된 아이템 이동 로직 구현
    print("Moving items: ${selectedItems}");
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

  /*
  * 여기까지
  * */

  final List<DumyContents> items = contentsList;
  List<String> typeList = ["Type"];
  List<String> widgetNameList = ["All Widgets"];
  List<String> tagList = ["Tags"];
  List<String> dateList = ["Date", "최신순", "오래된 순"];

  final List<ProfileImageCard> profileImageCardList = [
    ProfileImageCard('assets/testImage1.png', '이미지 제목1'),
    ProfileImageCard('assets/testImage2.png', '이미지 제목2'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목3'),
    ProfileImageCard('assets/testImage4.png', '이미지 제목4'),
    ProfileImageCard('assets/testImage1.png', '이미지 제목5'),
    ProfileImageCard('assets/testImage2.png', '이미지 제목6'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목7'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목8'),
  ];

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
