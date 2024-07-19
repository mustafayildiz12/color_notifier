import 'package:color_notifier/color_picker_dialog.dart';
import 'package:flutter/material.dart';

class ColorNotifierPage extends StatefulWidget {
  const ColorNotifierPage({super.key});

  @override
  State<ColorNotifierPage> createState() => _ColorNotifierPageState();
}

class _ColorNotifierPageState extends State<ColorNotifierPage> {
  ValueNotifier<Color> scaffolColor = ValueNotifier(Colors.pink);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scaffolColor,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Value Notifier"),
          ),
          backgroundColor: scaffolColor.value,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await openColorPickerDialog();
                    },
                    child: const Text("Change Color"))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> openColorPickerDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          scaffolColor: scaffolColor,
        );
      },
    );
  }
}
