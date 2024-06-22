import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/screen/profile/widget/custom_check_box.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderBar extends StatefulWidget {
  final List<String> typeList;
  final List<String> widgetNameList;
  final List<String> tagList;
  final List<String> dateList;
  const HeaderBar(
      {super.key,
      required this.tagList,
      required this.typeList,
      required this.widgetNameList,
      required this.dateList});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  double headerLeftPadding = 20;
  double width = 924;
  bool isAllCheck = false;

  String selectedType = "";
  String selectedWidgetName = "";
  String selectedTag = "";
  String selectedDate = "";

  ProfileViewModel profileVm = ProfileViewModel();
  Function()? listener;

  @override
  void initState() {
    selectedType = widget.typeList.first;
    selectedWidgetName = widget.widgetNameList.first;
    selectedTag = widget.tagList.first;
    selectedDate = widget.dateList.first;

    super.initState();
    if (mounted) {
      listener = () {
        setState(() {});
      };
    }
    profileVm.addListener(listener!);
    super.initState();
  }

  @override
  void dispose() {
    profileVm.removeListener(listener!);
    listener = null;
    super.dispose();
  }

  void selectedAllCheck(bool value) {
    setState(() {
      isAllCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorAssets.blackColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _checkAndCount(),
          _checkType(),
          _checkWidgetName(),
          _checkTag(),
          _checkDate(),
        ],
      ),
    );
  }

  Widget _checkDate() {
    return SizedBox(
      width: 134,
      child: DropdownButton2<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        value: selectedDate,
        onChanged: (String? newValue) {
          setState(() {
            selectedDate = newValue!;
          });
        },
        items: widget.dateList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _checkWidgetName() {
    return SizedBox(
      width: 292,
      child: DropdownButton2<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        value: selectedWidgetName,
        onChanged: (String? newValue) {
          setState(() {
            selectedWidgetName = newValue!;
          });
        },
        items:
            widget.widgetNameList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: Alignment.centerLeft, // 텍스트 왼쪽 정렬
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _checkTag() {
    return SizedBox(
      width: 134,
      child: DropdownButton2<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        value: selectedTag,
        onChanged: (String? newValue) {
          setState(() {
            selectedTag = newValue!;
          });
        },
        items: widget.tagList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _checkType() {
    return SizedBox(
      width: 134,
      child: DropdownButton2<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        value: selectedType,
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue!;
          });
        },
        items: widget.typeList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _checkAndCount() {
    return SizedBox(
      width: 134,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCheckBox(
            isChecked: profileVm.isAllChecked,
            onChanged: (selected) {
              profileVm.toggleAllSelection(selected);
              print("전체 선택: $selected");
              print("선택된 항목 수: ${profileVm.selectedItems.length}");
            },
          ),
          SizedBox(width: 10),
          Text(
            "${profileVm.selectedItems.length}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorAssets.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
