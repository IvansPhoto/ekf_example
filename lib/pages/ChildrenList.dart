import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';

class ChildrenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('The list of employees'),
      ),
      body: Center(child: Text('ChildList')),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, RouteNames.newEmployee),
      ),
    );

  }
}
