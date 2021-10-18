import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';
import 'package:plan_your_time/screens/taskview.dart';

class CListItem extends StatefulWidget {
  final Item item;

  const CListItem({this.item, Key key}) : super(key: key);

  @override
  _CListItemState createState() => _CListItemState();
}

class _CListItemState extends State<CListItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0, color: Colors.transparent, child: _buildTile());
  }

  Widget _buildTile() {
    if (widget.item.items.isEmpty || !expanded) {
      return Card(
        margin: const EdgeInsets.all(0),
          child: ListTile(
          //tileColor: Colors.white,
          leading: Icon(widget.item.icon),
          title: Text(widget.item.name),
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TaskView(item: widget.item);
                }),
              );
              //this.expanded = !expanded;
            });
          },
          onLongPress: () {
            setState(() {
              this.expanded = !expanded;
            });
        },
      ));
    } else {
      return Column(
        children: <Widget>[
          Card(
            //color: Colors.red,
            margin: const EdgeInsets.all(0),
            child: ListTile(
              leading: Icon(widget.item.icon),
              title: Text(widget.item.name),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TaskView(item: widget.item);
                    }),
                  );
                  //this.expanded = !expanded;
                });
              },
              onLongPress: () {
                setState(() {
                  this.expanded = !expanded;
                });
              },
            ),
          ),
          Container(
            //color: Colors.red,
            margin: const EdgeInsets.only(left: 25, top: 5),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.item.items.length,
              itemBuilder: (context, index) {
                return CListItem(
                  item: widget.item.items[index],
                );
              },
            ),
          )
        ],
      );
    }
  }
}
