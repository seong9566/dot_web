import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    ///TODO : 높이 80되어야함.

    return SizedBox(
      width: 924,
      height: 80,
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 40.0, top: 40, bottom: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: ColorAssets.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: ColorAssets.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: ColorAssets.primaryColor),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
