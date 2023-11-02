import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medilink/Admin/statistics.dart';
import 'package:medilink/db/model/data_model.dart';

 ValueNotifier<List<DepartmentModel>> deptListNotifier=ValueNotifier([]);



//to add departments
Future<void> addDepartment(DepartmentModel value) async{
  final deptDB = await Hive.openBox<DepartmentModel>('dept_db');
  final id = await deptDB.add(value);
  value.id=id;

  deptListNotifier.value.add(value);
  deptListNotifier.notifyListeners();

}

//to get departments
Future<void> getDepartment() async{
  final deptDB = await Hive.openBox<DepartmentModel>('dept_db');
  deptListNotifier.value.clear();

  deptListNotifier.value.addAll(deptDB.values);
  deptListNotifier.notifyListeners();
}

//to delete departments
Future<void> deleteDept(int id) async{
  final deptDB = await Hive.openBox<DepartmentModel>('dept_db');
  await deptDB.delete(id);
  getDepartment();
}

//to edit departments
Future<void> editDept(int id) async{
  final deptDB = await Hive.openBox<DepartmentModel>('dept_db');
  

}

//to set specialiazation drop down in doctor page
//  Future<List> deptDropDown() async {
//   final deptDD = await Hive.openBox('debt_db');
//   List deptDrop = deptDD.values.toList();
//   return deptDrop;
// }

//  Future<List> deptDropDown() async {
//   final deptDD = await Hive.openBox('debt_db');
//   List<String> deptDrop = deptDD.values.map((dynamic value) => value.toString()).toList();
//   return deptDrop;
// }

//  Future<List<String>> deptDropDown() async {
//   final deptDD = await Hive.openBox('debt_db');
//   List<dynamic> deptDrop = deptDD.values.toList();
//   List<String> stringList=deptDrop.cast<String>().toList();
//   return stringList;
// }


//to get department coount
// Future<int?> deptCount() async {
//   final box = await Hive.openBox('dept_db');
//   int itemCount = box.length;
//   //return itemCount;
//   //print('Number of items in the box: $itemCount');
// }