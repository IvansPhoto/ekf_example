import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChildrenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeesData employee = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('The list of children'),
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
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('${theChild.surName} ${theChild.name}'),
//                      subtitle: Text('${theChild.birthdate.year}-${theChild.birthdate.month}-${theChild.birthdate.day}'),
                      onTap: () => Navigator.of(context).pushNamed(RouteNames.showChild, arguments: theChild),
                    ),
                    if (employee != null)
                      FlatButton.icon(
                        label: Text('Add to ${employee.name} ${employee.surName}'),
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          employee.children.add(theChild);
                          employee.save();
                          Navigator.pop(context);
                        },
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, RouteNames.newChildren),
      ),
    );
  }
}
