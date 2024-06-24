import 'package:flutter/material.dart';

import '../profile_view_model.dart';

class EditWidgetsScreen extends StatefulWidget {
  const EditWidgetsScreen({super.key});

  @override
  State<EditWidgetsScreen> createState() => _EditWidgetsScreenState();
}

class _EditWidgetsScreenState extends State<EditWidgetsScreen> {
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
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: profileVm.widgetDataList.length,
            itemBuilder: (context, index) {
              return profileVm.widgetDataList[index];
            }),
      ],
    );
  }
}
