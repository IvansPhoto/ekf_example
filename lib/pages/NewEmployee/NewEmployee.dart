import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'package:ekf_example/pages/NewEmployee/EmployeeForm.dart';

class NewEmployee extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final EmployeesData employee = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('The list of employees'),
      ),
      body: EmployeeForm(employee: employee,),
    );
  }
}
