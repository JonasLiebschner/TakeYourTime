import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Projects"),
      ),
    );
  }
}
