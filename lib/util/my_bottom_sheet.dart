import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onCancel;
  final void Function()? onSave;
  MyBottomSheet({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(children: [
        TextField(
          autofocus: true,
          controller: controller,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            hintText: "Enter a new task",
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).primaryColorLight)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onCancel,
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onSave,
              child: const Text("Save"),
            ),
          ],
        ),
      ]),
    );
  }
}
