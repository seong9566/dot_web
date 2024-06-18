import 'package:do_in_web/screen/profile/edit/widget/header_bar.dart';
import 'package:do_in_web/screen/widget/search_field.dart';
import 'package:flutter/material.dart';

class EditContentsScreen extends StatefulWidget {
  const EditContentsScreen({super.key});

  @override
  State<EditContentsScreen> createState() => _EditContentsScreenState();
}

class _EditContentsScreenState extends State<EditContentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        SearchField(leftIcon: false),
        SizedBox(height: 44),
        HeaderBar(),
      ],
    );
  }
}
