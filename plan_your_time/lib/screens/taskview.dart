import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';

class TaskView extends StatefulWidget {

  final Item item;

  const TaskView({Key key, this.item}) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    textController = TextEditingController(text: widget.item.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Text(widget.item.name),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(  //Name Row
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Name"),
                      ),
                    ),
                    Align(
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: textController,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
