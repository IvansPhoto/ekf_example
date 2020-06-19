import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'package:ekf_example/widgets/employee-form.dart';

EmployeesData brad = EmployeesData(name: 'Brad', surName: 'Tra');

class NewEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('The list of employees'),
      ),
      body: EmployeeForm(),
    );
  }
}

