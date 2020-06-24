import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';

class ActionButtons extends StatelessWidget {
	final EmployeesData employee;

	ActionButtons({this.employee});

	@override
	Widget build(BuildContext context) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				FlatButton.icon(
					onPressed: () => Navigator.of(context).pushNamed(RouteNames.newEmployee, arguments: employee),
					icon: Icon(Icons.edit),
					label: Text('Edit'),
				),
				FlatButton.icon(
					onPressed: () => Navigator.push(
						context,
						MaterialPageRoute(builder: (context) => _DeleteConfirmation(employee: employee), fullscreenDialog: true),
					),
					icon: Icon(Icons.delete_forever),
					label: Text('Delete'),
				)
				//TODO: modal to confirm delete the employee
			],
		);
	}
}

class _DeleteConfirmation extends StatelessWidget {
	final EmployeesData employee;

	_DeleteConfirmation({this.employee});

	final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				key: _scaffoldKey,
				appBar: AppBar(
					elevation: 0,
					centerTitle: true,
					title: const Text('Confirmation'),
				),
				body: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Text('Are you sure to delete of:'),
							Text('${employee.name} ${employee.surName}'),
							FlatButton.icon(onPressed: () => Navigator.pop(context), icon: Icon(Icons.restore), label: Text('Stay in the list!')),
							FlatButton.icon(
									onPressed: () {
										employee.delete();
										Navigator.pop(context);
										Navigator.pop(context);
										_scaffoldKey.currentState.showSnackBar(SnackBar(
											content: Text('The employee has been deleted.'),
											duration: Duration(seconds: 5),
											elevation: 0,
										));
									},
									icon: Icon(Icons.delete_forever),
									label: Text('Remove from the list!'))
						],
					),
				));
	}
}