import 'package:ekf_example/pages/SelectChildren/SelectChildrenListTitle.dart';
import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SelectChildren extends StatefulWidget {
  @override
  _SelectChildrenState createState() => _SelectChildrenState();
}

class _SelectChildrenState extends State<SelectChildren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Select children'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ChildrenData>(Boxes.childrenBox).listenable(),
        builder: (context, Box<ChildrenData> box, _) {
          if (box.values.length == 0) return Center(child: Text('No children in the list'));
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              ChildrenData theChild = box.getAt(index);
              return Card(
                elevation: 0,
                child: SelectChildrenListTitle(theChild: theChild)
              );
            },
          );
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () => Navigator.pushNamed(context, RouteNames.newChildren),
      ),
    );
  }
}
