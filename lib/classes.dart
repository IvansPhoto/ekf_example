import 'package:hive/hive.dart';
part 'classes.g.dart';

abstract class RouteNames {
  static const index = '/';
  static const EmployeesList = '/EmployeesList';
  static const NewEmployee = '/NewEmployee';
  static const ChildrenList = '/ChildrenList';
  static const NewChildren = '/NewChildren';
}

const String EmployeesBox = 'EmployeesBox';
const String ChildrenBox = 'ChildrenBox';

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
