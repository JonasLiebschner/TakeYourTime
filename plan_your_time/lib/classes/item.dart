import 'package:flutter/cupertino.dart';

class Item {

  var name;

  var icon;

  List<Item> items = [];

  Item(String name, IconData icon) {
    this.name = name;
    this.icon = icon;
  }

  void addItem(Item item) {
    items.add(item);
  }

}