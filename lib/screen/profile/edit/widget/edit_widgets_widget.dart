import 'package:do_in_web/screen/profile/widget/swiper_card_widget.dart';
import 'package:flutter/material.dart';

import '../../profile_view_model.dart';

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

  bool isButtonVisible() {
    if (profileVm.profileImageCardList.length > 4) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwiperCardWidget(
          isEdit: true,
          cardItem: profileVm.profileImageCardList,
          isButtonVisible: isButtonVisible(),
        )
      ],
    );
  }
}
