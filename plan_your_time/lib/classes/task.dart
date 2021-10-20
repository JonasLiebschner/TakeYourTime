import 'item.dart';
import 'package:flutter/material.dart';

class Task extends Item {

  bool _checked = false;

  Task(String name, [IconData icon = Icons.assignment]) : super(name, icon);

  bool getChecked() {
    return _checked;
  }

  void setChecked(bool check) {
    _checked = check;
  }

}