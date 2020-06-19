import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmployeeForm extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final EmployeesData employee;

  EmployeeForm({this.employee});

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  TextEditingController _nameTEC;
  TextEditingController _surnameTEC;
//  TextEditingController _birthdayTEC;

  Box<EmployeesData> employeesBox = Hive.box<EmployeesData>(Boxes.employeesBox);
  int newId;

  @override
  void initState() {
    newId = employeesBox.values.length;
    print(newId);
    if (widget.employee == null) {
      _nameTEC = TextEditingController();
      _surnameTEC = TextEditingController();
//      _birthdayTEC = TextEditingController();
    } else {
      _nameTEC = TextEditingController(text: widget.employee.name);
      _surnameTEC = TextEditingController(text: widget.employee.surName);
//      _birthdayTEC = TextEditingController(text: widget.employee.birthdate);
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameTEC.dispose();
    _surnameTEC.dispose();
//    _birthdayTEC.dispose();
    super.dispose();
  }

  void _addEmployee() {
    employeesBox.add(EmployeesData(name: _nameTEC.text, surName: _surnameTEC.text));
    Navigator.of(context).pop();
  }

  void _updateEmployee() {
    widget.employee.name = _nameTEC.text;
    widget.employee.surName = _surnameTEC.text;
    widget.employee.save();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        autovalidate: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _nameTEC,
              decoration: const InputDecoration(hintText: 'Name', labelText: "The name"),
              maxLength: 50,
              keyboardType: TextInputType.text,
              validator: (value) => value.isEmpty ? 'Enter a employee name' : null,
            ),
            TextFormField(
              controller: _surnameTEC,
              decoration: const InputDecoration(hintText: 'Surname', labelText: "The surname"),
              maxLength: 50,
              keyboardType: TextInputType.text,
              validator: (value) => value.isEmpty ? 'Enter a employee surname' : null,
            ),
//            CalendarDatePicker(initialDate: null, firstDate: null, lastDate: null, onDateChanged: null),
            RaisedButton(
              elevation: 0,
              onPressed: () => {if (widget._formKey.currentState.validate()) widget.employee == null ? _addEmployee() : _updateEmployee()},
              child: widget.employee == null ? const Text('Submit') : const Text('Update'),
            ),
          ],
        ));
  }
}
