import 'package:ekf_example/classes.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Autodesk/ekf_example/lib/pages/NewEmployee/_employeeForm.dart';

class NewEmployee extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				elevation: 0,
				title: const Text('The list of children'),
			),
			body: _ChildForm(),
		);
	}
}

class _ChildForm extends StatefulWidget {

  @override
  _ChildFormState createState() => _ChildFormState();
}

class _ChildFormState extends State<_ChildForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

