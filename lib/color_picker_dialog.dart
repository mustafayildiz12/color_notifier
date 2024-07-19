import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({super.key, required this.scaffolColor});

  final ValueNotifier<Color> scaffolColor;

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.scaffolColor,
      builder: (context, value, child) {
        return AlertDialog(
          backgroundColor: widget.scaffolColor.value,
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
              child: ColorPicker(
            pickerColor: widget.scaffolColor.value,
            onColorChanged: (value) {
              widget.scaffolColor.value = value;
            },
          )),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
