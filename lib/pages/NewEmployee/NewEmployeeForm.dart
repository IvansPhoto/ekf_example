import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  TextEditingController _positionTEC;
  DateTime _birthday;
  String _birthdayText;

  Box<EmployeesData> employeesBox = Hive.box<EmployeesData>(Boxes.employeesBox);

  @override
  void initState() {
    if (widget.employee == null) {
      _nameTEC = TextEditingController();
      _surnameTEC = TextEditingController();
      _positionTEC = TextEditingController();
      _birthdayText = '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().day.toString()}';
    } else {
      _nameTEC = TextEditingController(text: widget.employee.name);
      _surnameTEC = TextEditingController(text: widget.employee.surName);
      _positionTEC = TextEditingController(text: widget.employee.position);
      _birthday = widget.employee.birthdate;
      _birthdayText = '${widget.employee.birthdate.year.toString()}-${widget.employee.birthdate.month.toString()}-${widget.employee.birthdate.day.toString()}';
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameTEC.dispose();
    _surnameTEC.dispose();
    _positionTEC.dispose();
    super.dispose();
  }

  void _addEmployee() {
    employeesBox.add(EmployeesData(
      name: _nameTEC.text,
      surName: _surnameTEC.text,
      birthdate: _birthday,
      position: _positionTEC.text,
    ));
    Navigator.of(context).pop();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('The employee has been added.'),
      elevation: 0,
      duration: Duration(seconds: 5),
    ));
  }

  void _updateEmployee() {
    widget.employee.name = _nameTEC.text;
    widget.employee.surName = _surnameTEC.text;
    widget.employee.position = _positionTEC.text;
    widget.employee.birthdate = _birthday;
    widget.employee.save();
    Navigator.of(context).pop();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('The employee has been updated.'),
      elevation: 0,
      duration: Duration(seconds: 5),
    ));
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
              validator: (value) => value.isEmpty ? 'Enter the employee name' : null,
            ),
            TextFormField(
              controller: _surnameTEC,
              decoration: const InputDecoration(hintText: 'Surname', labelText: "The surname"),
              maxLength: 50,
              keyboardType: TextInputType.text,
              validator: (value) => value.isEmpty ? 'Enter the employee surname' : null,
            ),
            TextFormField(
              controller: _positionTEC,
              decoration: const InputDecoration(hintText: 'Position', labelText: "The position"),
              maxLength: 50,
              keyboardType: TextInputType.text,
              validator: (value) => value.isEmpty ? 'Enter the employee position' : null,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  elevation: 0,
                  child: widget.employee == null ? const Text('Select birthday') : const Text('Update birthday'),
                  onPressed: () => showDatePicker(
                    context: context,
                    initialDate: widget.employee == null ? DateTime.now() : widget.employee.birthdate,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2021),
                  ).then((dateTime) => setState(() {
                        _birthday = dateTime;
                        _birthdayText = '${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}';
                      })),
                ),
                Text(_birthdayText)
              ],
            ),
            RaisedButton(
              elevation: 0,
              onPressed: () => {if (widget._formKey.currentState.validate()) widget.employee == null ? _addEmployee() : _updateEmployee()},
              child: widget.employee == null ? const Text('Submit') : const Text('Update'),
            ),
          ],
        ));
  }
}
