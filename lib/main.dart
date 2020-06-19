import 'package:ekf_example/classes.dart';
import 'package:ekf_example/pages/ChildrenList.dart';
import 'package:ekf_example/pages/EmployeesList.dart';
import 'package:ekf_example/pages/index.dart';
import 'package:ekf_example/pages/NewEmployee.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<EmployeesData>(EmployeesDataAdapter());
  Hive.registerAdapter<ChildrenData>(ChildrenDataAdapter());
  await Hive.openBox<EmployeesData>(Boxes.employeesBox);
  await Hive.openBox<ChildrenData>(Boxes.childrenBox);
  runApp(MaterialApp(
    title: 'The EFT test application',
    initialRoute: RouteNames.index,
    routes: {
      RouteNames.index: (BuildContext context) => Index(),
      RouteNames.employeesList: (BuildContext context) => EmployeesList(),
      RouteNames.newEmployee: (BuildContext context) => NewEmployee(),
      RouteNames.childrenList: (BuildContext context) => ChildrenList()
    },
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red[900],
      primaryColorDark: Colors.red[700],
      primaryColorLight: Colors.red[500],
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red[900],
      primaryColorDark: Colors.red[700],
      primaryColorLight: Colors.red[500],
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal, height: 15, buttonColor: Colors.red[900]),
      textTheme: TextTheme(button: TextStyle(fontSize: 25), headline1: TextStyle(fontSize: 25))
    ),
  ));
}


//Необходимо создать приложение на Flutter в котором будет реализована возможность вноса списка сотрудников и их детей.
//Должна быть возможность просмотра "подчиненного списка" детей
//Сцены:

//При открытии приложения появляется список в который можно внести сотрудников. Для внесения необходимы данные:
//1.      Фамилия
//2.      Имя
//3.      Отчество
//4.      Дата рождения
//5.      Должность

//При выборе сотрудника появляется список для ввода детей данного сотрудника, должна быть возможность внесения данных по ребенку:
//1.      Фамилия
//2.      Имя
//3.      Отчество
//4.      Дата рождения

//Должна быть возможность вернуться назад к Родителю.

//В списке сотрудников при наличии у них детей должно отображаться количество детей.

//Вариант хранения данных можно выбрать по своему усмотрению (XML, SQLLite, прочее). Возможен вариант реализации без хранения данных.