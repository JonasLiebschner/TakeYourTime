import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/task.dart';

import 'item.dart';

class TaskList extends Item {

  List<Task> _tasks = [];

  TaskList(String name, IconData icon) : super(name, icon);

  void addTask(Task task) {
    _tasks.add(task);
  }

  List<Task> getTasks() {
    return _tasks;
  }

}