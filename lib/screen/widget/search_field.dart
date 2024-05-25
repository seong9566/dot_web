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
    return SizedBox(
      width: 608,
      height: 44,
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
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
