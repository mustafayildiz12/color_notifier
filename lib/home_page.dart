import 'package:color_notifier/color_picker_second_dialog.dart';
import 'package:color_notifier/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color scaffolColor = Colors.white;
  bool refreshValue = false;
  @override
  Widget build(BuildContext context) {
    print("home clicked");
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: scaffolColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("text1"),
            const Text("text 2"),
            ElevatedButton(
                onPressed: () async {
                  await openColorPickerDialog();
                },
                child: const Text("Change Color")),
            MyCheckBox(
              refreshValue: refreshValue,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  print(refreshValue);
                },
                child: const Text("Save")),
          ],
        ),
      ),
    );
  }

  Future<void> openColorPickerDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ColorPickerSecondDialog(
          scaffolColor: scaffolColor,
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          scaffolColor = value;
        });
      }
    });
  }
}
