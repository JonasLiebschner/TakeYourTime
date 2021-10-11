import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';

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
    return Card(
        elevation: 0,
        color: Colors.white54,
        child: _buildTile()
    );
  }

  Widget _buildTile() {
    if (widget.item.items.isEmpty || !expanded) {
      return ListTile(
          leading: Icon(widget.item.icon),
          title: Text(widget.item.name),
        onTap: () {
            setState(() {
              this.expanded = !expanded;
            });
        },
      );
    } else {
      return Column(
        children: [
          ListTile(
            leading: Icon(widget.item.icon),
            title: Text(widget.item.name),
            onTap: () {
              setState(() {
                this.expanded = !expanded;
              });
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
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
