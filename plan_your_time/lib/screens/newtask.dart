import 'package:flutter/material.dart';
import 'package:plan_your_time/classes/item.dart';
import 'package:plan_your_time/classes/task.dart';

class NewTaskView extends StatefulWidget {

  final void Function(Task value) parentAction;

  const NewTaskView({Key key, this.parentAction}) : super(key: key);

  @override
  _NewTaskViewState createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {

  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    textController = TextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: Text("New task"),
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
                            decoration: InputDecoration(
                                hintText: "Enter your name"
                            ),
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            widget.parentAction(new Task(textController.text));
            Navigator.pop(context);
          },
      ),
    );
  }
}
