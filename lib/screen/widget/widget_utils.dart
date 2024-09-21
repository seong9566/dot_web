import 'package:flutter/material.dart';

Widget defaultButton({
  required bool reversRadius,
  required String title,
  required VoidCallback callback,
  required Color backgroundColor,
  required Color titleColor,
}) {
  final BorderRadius _radius;
  if (reversRadius) {
    _radius = const BorderRadius.only(
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
  } else {
    _radius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );
  }
  return GestureDetector(
    onTap: callback,
    child: Container(
      width: 156.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: _radius,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
      ),
    ),
  );
}

List<Widget> twoBottomNavDot({required Color color}) {
  return [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ),
  ];
}
