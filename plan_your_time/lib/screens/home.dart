import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';
import 'package:plan_your_time/widgets/custom_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var listElements = [
    Item("One", Icons.account_balance_wallet),
    Item("Two", Icons.settings),
    Item("Three", Icons.av_timer),
    Item("Four", Icons.work_off_outlined),
    Item("Five", Icons.volume_mute_outlined),
  ];

  @override
  void initState() {
    super.initState();
    listElements[0].addItem(Item("One.One", Icons.accessible_forward_rounded));
    listElements[0].addItem(Item("One.Two", Icons.assignment_late_outlined));
    listElements[0].items[0].addItem(Item("ABC", Icons.assignment_late_outlined));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/negative-space-colorful-bokeh-abstract-17.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: _myListView(context),
      ),
    );
  }
  
  // replace this function with the code in the examples
  Widget _myListView(BuildContext context) {
    return ListView.builder(
      itemCount: listElements.length,
        itemBuilder: (context, index) {
          return CListItem(
            item: listElements[index],
          );
        },
    );
  }
}
