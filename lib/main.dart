import 'package:flutter/material.dart';
import 'package:sembast_task_crud/app_style.dart';
import 'package:sembast_task_crud/screens/task_list.dart';

void main() {
  runApp(TaskCrudApp());
}

class TaskCrudApp extends StatelessWidget with AppStyle {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: createLightTheme(),
      darkTheme: createDarkTheme(),
      title: "Sembast Task CRUD",
      home: TaskListScreen(),
    );
  }
}
