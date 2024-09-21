import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditWidgetDialog extends StatefulWidget {
  const EditWidgetDialog({super.key});

  @override
  _EditWidgetDialogState createState() => _EditWidgetDialogState();
}

class _EditWidgetDialogState extends State<EditWidgetDialog> {
  String _widgetTitle = "On";
  String _widgetArrange = "1";
  double _radius = 0;
  String _selectedPosition = "All";
  String _contentsArrangeFirst = "4";
  String _contentsArrangeSecond = "1";
  double dropDownWidth = 134;
  double dropDownHeight = 40;
  double titleTextWidth = 292;
  TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // 화면의 80% 정도 차지
      padding: const EdgeInsets.only(left: 138, top: 40, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _widgetTitleRow(
            "Widget Title",
          ),
          const SizedBox(height: 40),
          _widgetArrangeRow(
              title: "Widget Arrange",
              value: _widgetArrange,
              items: ["1", "2", "3"],
              onChanged: (newValue) {
                setState(() {
                  _widgetArrange = newValue!;
                });
              }),
          SizedBox(height: 20),
          _buildSliderRow(),
          SizedBox(height: 20),
          _buildRadioRow(),
          SizedBox(height: 20),
          _widgetArrangeRow(
            title: "Contents Arrange",
            value: _contentsArrangeFirst,
            items: ["1", "2", "3", "4"],
            onChanged: (newValue) {
              setState(() {
                _contentsArrangeFirst = newValue!;
              });
            },
          ),
          SizedBox(height: 10),
          _widgetArrangeRow(
            title: "",
            value: _contentsArrangeSecond,
            items: ["1", "2", "3", "4"],
            onChanged: (newValue) {
              setState(() {
                _contentsArrangeSecond = newValue!;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('CANCEL'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Confirm action
                  Navigator.of(context).pop();
                },
                child: Text('CONFIRM'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _widgetTitleRow(String title) {
    return Row(
      children: [
        const Icon(Icons.help_outline, size: 20),
        const SizedBox(width: 10),
        SizedBox(
          width: titleTextWidth,
          child: Text(
            title,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: dropDownWidth,
          height: dropDownHeight,
          child: DropdownButton2<String>(
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
            ),
            isExpanded: true,
            value: _widgetTitle,
            items: ['On', 'Off'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _widgetTitle = newValue!;
              });
            },
            underline: Container(), // 밑줄 없앰
          ),
        ),
        SizedBox(width: 24),
        Container(
          width: 450,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black,
            width: 0.5,
          )),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '기본 갤러리 위젯',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetArrangeRow({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      children: [
        const Icon(Icons.help_outline, size: 20),
        const SizedBox(width: 10),
        SizedBox(
          width: titleTextWidth,
          child: Text(
            title,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: dropDownWidth,
          height: dropDownHeight,
          child: DropdownButton2<String>(
            isExpanded: true,
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
            ),
            underline: SizedBox.shrink(),
            value: value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderRow() {
    return Row(
      children: [
        Icon(Icons.help_outline, size: 20),
        SizedBox(width: 10),
        Text("Radius"),
        SizedBox(width: 20),
        Expanded(
          child: Slider(
            value: _radius,
            min: 0,
            max: 100,
            divisions: 100,
            label: _radius.round().toString(),
            onChanged: (double value) {
              setState(() {
                _radius = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRadioRow() {
    return Row(
      children: [
        Icon(Icons.help_outline, size: 20),
        SizedBox(width: 10),
        Text("Position"),
        Row(
          children: [
            Radio<String>(
              value: "All",
              groupValue: _selectedPosition,
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value!;
                });
              },
            ),
            Text("All"),
            Radio<String>(
              value: "L-Top",
              groupValue: _selectedPosition,
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value!;
                });
              },
            ),
            Text("L-Top"),
            Radio<String>(
              value: "R-Top",
              groupValue: _selectedPosition,
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value!;
                });
              },
            ),
            Text("R-Top"),
            Radio<String>(
              value: "R-Bottom",
              groupValue: _selectedPosition,
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value!;
                });
              },
            ),
            Text("R-Bottom"),
          ],
        ),
      ],
    );
  }
}
