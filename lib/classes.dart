import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'classes.g.dart';

abstract class RouteNames {
  static final index = '/';
  static final employeesList = '/EmployeesList';
  static final showEmployee = '/ShowEmployee';
  static final newEmployee = '/NewEmployee/NewEmployee';
  static final childrenList = '/ChildrenList';
  static final showChild = '/ShowChild';
  static final newChildren = '/NewChild/NewChild';
  static final selectChildren = '/SelectChildren';
}
abstract class Boxes {
  static final String employeesBox = 'employees';
  static final String childrenBox = 'children';
}

class ChildrenListNotifier extends ChangeNotifier {
  List<ChildrenData> childrenList = [];

  void changeChildren(List<ChildrenData> newChildrenList) {
    childrenList = newChildrenList;
    notifyListeners();
  }
}

@HiveType(typeId: 0)
class EmployeesData extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String surName;

  @HiveField(3)
  String patronymic;

  @HiveField(4)
  DateTime birthdate;

  @HiveField(5)
  String position;

  @HiveField(6)
  List<ChildrenData> children;

  EmployeesData({this.id, this.name, this.surName, this.patronymic, this.birthdate, this.position, this.children});
}

@HiveType(typeId: 1)
class ChildrenData extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String surName;

  @HiveField(3)
  String patronymic;

  @HiveField(4)
  DateTime birthdate;

  @HiveField(5)
  EmployeesData parent;

  set setParent(EmployeesData newParent) => parent = newParent;

  ChildrenData({this.id, this.name, this.surName, this.patronymic, this.birthdate, this.parent});
}
