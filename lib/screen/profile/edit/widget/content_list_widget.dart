import 'package:do_in_web/screen/profile/profile_view_model.dart';
import 'package:do_in_web/common/import_util.dart';

import 'package:flutter/material.dart';

import '../../widget/custom_check_box.dart';
import '../data/dumy_contents.dart';

class ContentListWidget extends StatefulWidget {
  final List<DumyContents> data;
  const ContentListWidget({super.key, required this.data});

  @override
  State<ContentListWidget> createState() => _ContentListWidgetState();
}

class _ContentListWidgetState extends State<ContentListWidget> {
  final double width134 = 134 - 10;
  final double width292 = 292 - 10;

  final ProfileViewModel profileVm = ProfileViewModel();
  Function()? listener;

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 924,
      height: widget.data.length * 174.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _content(widget.data[index]);
        },
      ),
    );
  }

  Widget _content(DumyContents item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: ColorAssets.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 9,
            offset: Offset(0, 3), // 그림자의 위치 조정
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        children: [
          _checkBox(item),
          const SizedBox(width: 24),
          _typeData(item),
          const SizedBox(width: 24),
          _widgetData(item),
          const SizedBox(width: 24),
          _tagData(item),
          const SizedBox(width: 24),
          _dateData(item),
        ],
      ),
    );
  }

  Widget _dateData(DumyContents item) {
    return SizedBox(
      width: width134,
      height: 134,
      child: Center(
        child: Text(
          item.date,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorAssets.blackColor,
          ),
        ),
      ),
    );
  }

  Widget _tagData(DumyContents item) {
    return SizedBox(
      width: width134,
      height: 134,
      child: Center(
        child: Text(
          "${item.tags[0]} / ${item.tags[1]} / ${item.tags[2]}",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorAssets.blackColor),
        ),
      ),
    );
  }

  Widget _widgetData(DumyContents item) {
    return SizedBox(
      width: width292,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            item.widgetName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorAssets.blackColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ColorAssets.blackColor,
            ),
          ),
          Text(
            item.content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorAssets.blackColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }

  Widget _typeData(DumyContents item) {
    String type = item.type.type;
    Widget widget;
    if (type == "img") {
      widget = Image.asset(item.type.content);
    } else if (type == "video") {
      widget = Center(child: Text(item.type.content));
    } else {
      widget = Center(child: Text(item.type.content));
    }
    return SizedBox(
      width: width134,
      height: 134,
      child: widget,
    );
  }

  Widget _checkBox(DumyContents item) {
    return SizedBox(
      width: width134,
      height: 134,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomCheckBox(
              isChecked: profileVm.selectedItems.contains(item),
              onChanged: (selected) {
                profileVm.toggleSelection(item);
                print("선택했음");
                print("${profileVm.selectedItems.length}");
              },
            ),
          ),

          /// 메뉴바 Text + SizedBox 크기
          SizedBox(width: 19.2),
        ],
      ),
    );
  }
}
