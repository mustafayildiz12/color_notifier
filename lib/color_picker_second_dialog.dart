// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerSecondDialog extends StatefulWidget {
  ColorPickerSecondDialog({super.key, required this.scaffolColor});

  Color scaffolColor;

  @override
  State<ColorPickerSecondDialog> createState() =>
      _ColorPickerSecondDialogState();
}

class _ColorPickerSecondDialogState extends State<ColorPickerSecondDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.scaffolColor,
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
          child: ColorPicker(
        pickerColor: widget.scaffolColor,
        onColorChanged: (value) {
          setState(() {
            widget.scaffolColor = value;
          });
        },
      )),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            Navigator.pop(context, widget.scaffolColor);
          },
        ),
      ],
    );
  }
}
