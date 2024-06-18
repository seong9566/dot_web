import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../data/dumy_contents.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  double headerLeftPadding = 20;
  double width = 924;
  bool isAllCheck = false;

  // final List<String> typeList = ["Type", "img", "video", "text"];
  final List<String> typeList =
      contentsList.map((content) => content.type.type).toSet().toList();
  final List<String> widgetNameList =
      contentsList.map((content) => content.widgetName).toSet().toList();
  String selectedType = contentsList[0].type.type;
  String selectedWidgetName = contentsList[0].widgetName;

  void selectedAllCheck(bool value) {
    setState(() {
      isAllCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: headerLeftPadding),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorAssets.blackColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          _checkAndCount(),
          _checkType(),
        ],
      ),
    );
  }

  SizedBox _checkWidgetName() {
    return SizedBox(
      width: 200,
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedWidgetName,
        onChanged: (String? newValue) {
          setState(() {
            selectedWidgetName = newValue!;
          });
        },
        items: widgetNameList.map<DropdownMenuItem<String>>((String value) {
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
      width: 100,
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedType,
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue!;
          });
        },
        items: typeList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _checkAndCount() {
    return Row(
      children: [
        RoundCheckBox(
          size: 28,
          isChecked: isAllCheck,
          onTap: (selected) {
            selectedAllCheck(selected!);
          },
          borderColor: ColorAssets.blackColor,
          checkedColor: ColorAssets.whiteColor,
          checkedWidget: Icon(Icons.check, color: Colors.black),
        ),
        Text(
          "0",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorAssets.blackColor,
          ),
        ),
      ],
    );
  }
}
