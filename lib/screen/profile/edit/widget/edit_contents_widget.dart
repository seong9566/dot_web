import 'package:do_in_web/screen/profile/edit/widget/header_bar.dart';
import 'package:do_in_web/screen/widget/search_field.dart';
import 'package:flutter/material.dart';

import '../../profile_view_model.dart';
import 'content_list_widget.dart';

class EditContentsScreen extends StatefulWidget {
  const EditContentsScreen({super.key});

  @override
  State<EditContentsScreen> createState() => _EditContentsScreenState();
}

class _EditContentsScreenState extends State<EditContentsScreen> {
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
    profileVm.init();
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
    return Column(
      children: [
        const SizedBox(height: 20),
        const SearchField(leftIcon: false),
        const SizedBox(height: 44),
        HeaderBar(
          tagList: profileVm.tagList,
          typeList: profileVm.typeList,
          widgetNameList: profileVm.widgetNameList,
          dateList: profileVm.dateList,
        ),
        ContentListWidget(data: profileVm.filteredItem),
        const SizedBox(height: 100),
      ],
    );
  }
}
