import 'package:flutter/material.dart';
import 'package:sembast_task_crud/databases/task_store.dart';
import 'package:sembast_task_crud/models/tassk.dart';

class TaskDelete extends StatelessWidget {
  final TaskStore taskStore = TaskStore();
  final Widget child;
  final Task task;

  TaskDelete({this.task, this.child});

  Widget _getBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 16),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Future<bool> _confirmDismissHandler(
      BuildContext context, DismissDirection direction) async {
    final bool answer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Deseja Realmente remover esta tarefa?"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Cancel",
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text(
                "Delete",
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    return answer;
  }

  _onDismissedHandler(DismissDirection direction) {
    taskStore.delete(task);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return _confirmDismissHandler(context, direction);
      },
      direction: DismissDirection.endToStart,
      onDismissed: _onDismissedHandler,
      background: _getBackground(),
      key: Key(task.key.toString()),
      child: child,
    );
  }
}
