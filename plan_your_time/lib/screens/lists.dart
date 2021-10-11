import 'package:flutter/material.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({Key key}) : super(key: key);

  @override
  _ListsScreenState createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Lists"),
      ),
    );
  }
}
