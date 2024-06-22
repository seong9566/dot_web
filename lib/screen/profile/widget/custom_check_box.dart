import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.isChecked,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  double size = 22;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(!widget.isChecked);
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: widget.isChecked
            ? Icon(
                Icons.check,
                size: size * 0.8,
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
