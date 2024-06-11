import 'package:flutter/material.dart';

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
