import 'package:flutter/material.dart';
import 'package:ekf_example/classes.dart';

class SelectChildrenListTitle extends StatefulWidget {
  final ChildrenData theChild;
  final EmployeesData theEmployee;

  SelectChildrenListTitle({this.theChild, this.theEmployee});

  @override
  _SelectChildrenListTitleState createState() => _SelectChildrenListTitleState();
}

class _SelectChildrenListTitleState extends State<SelectChildrenListTitle> {
  bool _selected;

  @override
  void initState() {
    widget.theEmployee.children.forEach((employeeChild) {
      if (identical(employeeChild, widget.theChild)) {
        print('Identical: ${widget.theChild is ChildrenData} ${widget.theChild.name} ${widget.theChild.surName} - ${employeeChild is ChildrenData} ${employeeChild.name} ${employeeChild.surName}');
        _selected = true;
      } else {
        print('Not: ${widget.theChild is ChildrenData} ${widget.theChild.name} ${widget.theChild.surName} - ${employeeChild is ChildrenData} ${employeeChild.name} ${employeeChild.surName}');
        _selected = false;
      }
    });
    super.initState();
  }

  void _select() {
    setState(() {
      _selected = !_selected;

      if (!widget.theEmployee.children.contains(widget.theChild) && _selected) {
        print('\nsetState() ${widget.theEmployee.children.contains(widget.theChild)}\nIdentical: ${widget.theChild.name} ${widget.theChild.surName} - ${widget.theEmployee.name} ${widget.theEmployee.surName}');
        widget.theEmployee.children.add(widget.theChild);
        widget.theEmployee.save();
      }
      if (widget.theEmployee.children.contains(widget.theChild) && !_selected) {
        print('\nsetState() ${widget.theEmployee.children.contains(widget.theChild)}\nNot: ${widget.theChild.name} ${widget.theChild.surName} - ${widget.theEmployee.name} ${widget.theEmployee.surName}');
        widget.theEmployee.children.remove(widget.theChild);
        widget.theEmployee.save();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${widget.theChild.surName} ${widget.theChild.name} ${widget.theChild.patronymic}'),
      selected: _selected,
      onTap: () => _select(),
      trailing: _selected ? Icon(Icons.check_circle) : Icon(Icons.radio_button_unchecked),
    );
  }
}
