import 'package:flutter/material.dart';

class Item {

  var name;

  var icon;

  bool _checked = false;

  List<Item> items = [];

  Item(String name, IconData icon) {
    this.name = name;
    this.icon = icon;
  }

  void addItem(Item item) {
    items.add(item);
  }

  bool getChecked() {
    return _checked;
  }

  void setChecked(bool check) {
    _checked = check;
  }

}