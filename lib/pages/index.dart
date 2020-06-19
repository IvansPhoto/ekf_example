import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home page'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            FlatButton(onPressed: () => Navigator.pushNamed(context, RouteNames.employeesList), child: const Text('Employees List')),
            FlatButton(onPressed: () => Navigator.pushNamed(context, RouteNames.childrenList), child: const Text('Children List')),
          ],
        ),
      ),
    );
  }
}
