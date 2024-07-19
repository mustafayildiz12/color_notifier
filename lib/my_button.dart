// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({
    Key? key,
    required this.refreshValue,
  }) : super(key: key);
  bool refreshValue;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.refreshValue,
        onChanged: (value) {
          setState(() {
            widget.refreshValue = value!;
          });
        });
  }
}
