import 'package:hive/hive.dart';
part 'classes.g.dart';

abstract class RouteNames {
  static final index = '/';
  static final employeesList = '/EmployeesList';
  static final newEmployee = '/NewEmployee';
  static final childrenList = '/ChildrenList';
  static final newChildren = '/NewChildren';
}
abstract class Boxes {
  static final String employeesBox = 'employees';
  static final String childrenBox = 'children';
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
  ChildrenData({this.id, this.name, this.surName, this.patronymic, this.birthdate, this.parent});
}
