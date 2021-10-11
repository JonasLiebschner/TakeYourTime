import 'package:flutter/material.dart';
import 'package:plan_your_time/screens/projects.dart';

import 'home.dart';
import 'lists.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  int _selectedIndex = 1;

  List<Widget> _children = <Widget>[
    ListsScreen(),
    HomeScreen(),
    ProjectsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plan your time"),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: "Finances",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: "Wallet",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
