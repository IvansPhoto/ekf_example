import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';
import 'package:ekf_example/pages/NewChild/NewChildForm.dart';

class NewChild extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		final ChildrenData child = ModalRoute.of(context).settings.arguments;
		return Scaffold(
			appBar: AppBar(
				elevation: 0,
				title: const Text('The list of children'),
			),
			body: NewChildForm(child: child,),
		);
	}
}



