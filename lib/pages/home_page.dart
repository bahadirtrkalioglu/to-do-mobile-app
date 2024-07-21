import 'package:flutter/material.dart';
import 'package:to_do_app_repeat/pages/about_page.dart';
import 'package:to_do_app_repeat/util/my_bottom_sheet.dart';

import '../util/ToDoListItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List> missons = [
    ["You can add task", false],
    ["by clicking add button", false],
  ];

  TextEditingController _controller = TextEditingController();

  // make checkbox clickable
  Function(bool?)? checkBoxChanged(List willChangeList, int index) {
    setState(() {
      willChangeList[index][1] = !willChangeList[index][1];
      return willChangeList[index][1];
    });
  }

  void createNewTask() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet(
          controller: _controller,
          onCancel: cancelNewTask,
          onSave: saveNewTask,
        );
      },
    );
  }

  // save new task
  void saveNewTask() {
    setState(() {
      missons.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  // cancel new task
  void cancelNewTask() {
    Navigator.of(context).pop();
    _controller.clear();
  }

  //delete the task
  void deleteTheTask(List willChangeList, int index) {
    setState(() {
      willChangeList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AboutPage();
              },
            ));
          },
        ),
        elevation: 0,
        title: Text("To Do App"),
        centerTitle: true,
        actions: [IconButton(onPressed: createNewTask, icon: Icon(Icons.add))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: missons.length,
            itemBuilder: (context, index) {
              return ToDoList(
                checkValue: missons[index][1],
                onChanged: (_) => checkBoxChanged(missons, index),
                text: missons[index][0],
                deleteTask: () => deleteTheTask(missons, index),
              );
            },
          )),
    );
  }
}
