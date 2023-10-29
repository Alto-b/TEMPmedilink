// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medilink/model/transactions.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {

    final _departmentController=TextEditingController();
    final _formKey = GlobalKey<FormState>();

  final List<String> departments=[];
  final _department = Hive.box('department');

  @override
  void dispose(){
    //Hive.close();
    Hive.box('department').close();
    super.dispose();
  }

   
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departments"),
        centerTitle: true,
      ),


      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(child: Column(
                key: _formKey,
                children: [
                  SizedBox(height: 50,),
                  TextFormField(
                    validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Cannot be empty';
                            }
                             if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                 return 'Only characters are allowed';
                                }
                               return null;
                           },
                           controller: _departmentController,
                           decoration: InputDecoration(
                            hintText: "Enter department"
                           ),
                  ),SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () {
                        final departmentText = _departmentController.text.trim();
                       if (departmentText.isNotEmpty) {
                      _addDepartment({
                        "dept":_departmentController
                      });
                      _departmentController.text='';
                        }
                      },
                  child: Text("Add"),
                ),
                  SizedBox(height: 20,),
                  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(departments[index]),
                    //title: Text("data"),
                    onTap: () {
                      
                    },
                    onLongPress: () {
                      
                    },
                  );
                },
              ),
                ],
              ),
              
              
              ),
            ],
          ),
          
          
          
        ),
      ),
      
      
    );
  }
// void addDepartment(String dept){
//   setState(() {
//     departments.add(dept);
//   });
// }

Future<void> _addDepartment(Map<String,dynamic> newItem) async{
  await _department.add(newItem);
}
  }
  

