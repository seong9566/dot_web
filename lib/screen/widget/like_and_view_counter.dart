import 'package:flutter/material.dart';

class LikeAndViewCounter extends StatefulWidget {
  const LikeAndViewCounter(
      {super.key, required this.icon, required this.counter});
  final Icon icon;
  final String counter;

  @override
  State<LikeAndViewCounter> createState() => _LikeAndViewCounterState();
}

class _LikeAndViewCounterState extends State<LikeAndViewCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon,
        Text(
          "88",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
