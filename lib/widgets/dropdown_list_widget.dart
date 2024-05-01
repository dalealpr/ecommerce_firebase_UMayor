import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final Map<String, dynamic> talla;
  final String Function(Map<String, dynamic>) getInitialDropdownValue;
  final void Function(String) onChanged;

  //Constructor
  const CustomDropdownButton({
    Key? key,
    required this.talla,
    required this.getInitialDropdownValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.getInitialDropdownValue(widget.talla);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      // Lista desplegable
      child: DropdownButton<String>(
        value: dropdownValue,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Color.fromARGB(255, 255, 255, 255),
        iconEnabledColor: Color.fromARGB(254, 0, 109, 255),
        underline: Container(
          height: 0,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          widget.onChanged(newValue!);
        },
        items: widget.talla.keys.map((String key) {
          return DropdownMenuItem<String>(
            value: key,
            child: Text(
              key,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
