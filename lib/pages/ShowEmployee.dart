import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShowEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeesData employee = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${employee.name} ${employee.surName}'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<EmployeesData>(Boxes.employeesBox).listenable(),
          builder: (context, Box<EmployeesData> box, _) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              children: <Widget>[
                if (employee.name != null)
                  RichText(
                      text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Name\n'),
                      TextSpan(text: employee.name),
                    ],
                  )),
                if (employee.name != null) Divider(),
                if (employee.surName != null)
                  RichText(
                      text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Surname\n'),
                      TextSpan(text: employee.surName),
                    ],
                  )),
                if (employee.surName != null) Divider(),
                if (employee.birthdate != null)
                  RichText(
                      text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: 'Birthday\n'),
                      TextSpan(text: '${employee.birthdate.year}-${employee.birthdate.month}-${employee.birthdate.day}'),
                    ],
                  )),
                if (employee.birthdate != null) Divider(),
                if (employee.position != null)
                  RichText(
                      text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Position\n'),
                      TextSpan(text: employee.position),
                    ],
                  )),
                if (employee.position != null) Divider(),
                if (employee.children != null)
                  RichText(
                      text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Children\n'),
                    ],
                  )),
                if (employee.children != null) Divider(),
                Row(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () => Navigator.of(context).pushNamed(RouteNames.newEmployee, arguments: employee),
                      icon: Icon(Icons.edit),
                      label: Text('Edit'),
                    ),
                    FlatButton.icon(
                      onPressed: () => print('Tap on the Delete button'),
                      icon: Icon(Icons.delete_forever),
                      label: Text('Delete'),
                    )
                    //TODO: modal to confirm delete the employee
                  ],
                )
              ],
            );
          }),
    );
  }
}
