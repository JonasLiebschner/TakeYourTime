import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';
import 'package:plan_your_time/classes/task.dart';
import 'package:plan_your_time/classes/tasklist.dart';
import 'package:plan_your_time/screens/newtask.dart';
import 'package:plan_your_time/screens/projects.dart';

import 'drawer.dart';
import 'home.dart';
import 'lists.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  int _selectedIndex = 1;

  TaskList selectedItem;


  @override
  void initState() {
    selectedItem = new TaskList("First List", Icons.assignment);
    Task taskOne = new Task("One", Icons.ondemand_video);
    taskOne.addItem(new Task("One.One", Icons.ondemand_video));
    selectedItem.addTask(taskOne);
    selectedItem.addTask(new Task("Two", Icons.ondemand_video));
    selectedItem.addTask(new Task("Three"));
    selectedItem.addTask(new Task("Four"));
    selectedItem.addTask(new Task("Five"));
    selectedItem.addTask(new Task("Six"));
    selectedItem.addTask(new Task("Seven"));
    selectedItem.addTask(new Task("Eight"));
    selectedItem.addTask(new Task("Nine"));
    selectedItem.addTask(new Task("Ten"));

    _children = <Widget>[
      ListsScreen(),
      HomeScreen(selectedTasklist: selectedItem),
      ProjectsScreen(),
    ];
  }

  List<Widget> _children;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addTask(Task newTask) {
    setState(() {
      selectedItem.addTask(newTask);
      _children = <Widget>[
        ListsScreen(),
        HomeScreen(selectedTasklist: selectedItem),
        ProjectsScreen(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: Text(
            selectedItem.name,
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      drawer: DrawerView(),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: "Listen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: "Projekte",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: Icon(Icons.add),
        onPressed: () {
          if (_selectedIndex == 1) {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return NewTaskView(parentAction: addTask,);
                }),
              );
              //this.expanded = !expanded;
            });
          }
        },
      ),
    );
  }
}
