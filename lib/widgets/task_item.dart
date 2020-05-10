import 'package:flutter/material.dart';
import 'package:sembast_task_crud/databases/task_store.dart';
import 'package:sembast_task_crud/models/tassk.dart';
import 'package:sembast_task_crud/widgets/task_delete.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final TaskStore taskStore = TaskStore();

  TaskItem({this.task});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  TextStyle _getTaskStyle() {
    return TextStyle(
        decoration: widget.task.done
            ? TextDecoration.lineThrough
            : TextDecoration.none);
  }

  _onChangeHandler(bool newValue) {
    setState(() {
      widget.task.done = newValue;
      widget.taskStore.update(widget.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskDelete(
      task: widget.task,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CheckboxListTile(
          value: widget.task.done,
          onChanged: _onChangeHandler,
          title: Text(
            widget.task.name,
            style: _getTaskStyle(),
          ),
        ),
      ),
    );
  }
}
