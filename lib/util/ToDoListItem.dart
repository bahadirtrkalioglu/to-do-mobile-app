import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final Function(bool?)? onChanged;
  final bool? checkValue;
  final String text;
  final void Function()? deleteTask;
  ToDoList({
    super.key,
    required this.onChanged,
    required this.checkValue,
    required this.text,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: checkValue, onChanged: onChanged),
              Container(
                width: screenWidth*0.50,
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: checkValue == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: deleteTask,
            icon: Icon(Icons.delete),
            tooltip: "Delete the task",
            color: Colors.red[400],

          ),
        ],
      ),
    );
  }
}
