import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';

class SelectChildrenListTitle extends StatefulWidget {

	final ChildrenData theChild;
	SelectChildrenListTitle({this.theChild});

  @override
  _SelectChildrenListTitleState createState() => _SelectChildrenListTitleState();
}

class _SelectChildrenListTitleState extends State<SelectChildrenListTitle> {

	bool _selected;

	@override
  void initState() {
		_selected = false;
    super.initState();
  }

  void _select() {
		setState(() {
		  _selected = !_selected;
		});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
	    title: Text('${widget.theChild.surName} ${widget.theChild.name}'),
	    selected: _selected,
	    onTap: () => _select(),
	    trailing: _selected ?  Icon(Icons.check_circle) : Icon(Icons.radio_button_unchecked),
    );
  }
}
