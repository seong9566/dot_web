import 'package:do_in_web/common/import_util.dart';

import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final VoidCallback? callback;
  final bool leftIcon;
  const SearchField({
    super.key,
    this.callback,
    required this.leftIcon,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO: 프로필 이동 버튼.
        if (widget.leftIcon)
          GestureDetector(
            onTap: widget.callback,
            child: CircleAvatar(),
          ),
        const SizedBox(width: 24),
        SizedBox(
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
        ),
      ],
    );
  }
}
