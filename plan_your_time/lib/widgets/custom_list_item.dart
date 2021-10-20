import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';
import 'package:plan_your_time/screens/taskview.dart';

/*
Class for custom list items

They consist of an icon, caption, and trailing if they have children
 */

class CListItem extends StatefulWidget {
  final Item item;

  const CListItem({this.item, Key key}) : super(key: key);

  @override
  _CListItemState createState() => _CListItemState();
}

class _CListItemState extends State<CListItem> {
  bool expanded = false;

  Icon checkIcon;

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0, color: Colors.transparent, child: _buildTile());
  }

  Widget _buildTile() {
    if (widget.item.getChecked()) {
      checkIcon = new Icon(Icons.check);
    } else {
      checkIcon = new Icon(Icons.check_box_outline_blank_rounded);
    }
    if (widget.item.items.isEmpty || !expanded) {
      return Card(
        margin: const EdgeInsets.all(0),
          child: ListTile(
          //tileColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    bool check = widget.item.getChecked();
                    widget.item.setChecked(!check);
                  });
                },
                icon: checkIcon,
            ),
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Icon(widget.item.icon),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(widget.item.name),
                )
              ],
            ),
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
            trailing: widget.item.items.isEmpty ? null
                : IconButton(
                onPressed: () {
                  setState(() {
                    this.expanded = !expanded;
                  });
                }
                , icon: Icon(Icons.arrow_drop_down)),
          )
      );
    } else {
      return Column(
        children: <Widget>[
          Card(
            //color: Colors.red,
            margin: const EdgeInsets.all(0),
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    bool check = widget.item.getChecked();
                    widget.item.setChecked(!check);
                  });
                },
                icon: checkIcon,
              ),
              title: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Icon(widget.item.icon),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: Text(widget.item.name),
                  )
                ],
              ),
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
              trailing: widget.item.items.isEmpty ? null
                  : IconButton(
                  onPressed: () {
                    setState(() {
                      this.expanded = !expanded;
                    });
                  }
                  , icon: Icon(Icons.arrow_drop_down)),
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
