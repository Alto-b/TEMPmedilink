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
  final List<String> departments=[];

  @override
  void dispose(){
    //Hive.close();
    Hive.box('departments').close();
    super.dispose();
  }

    final _departmentController=TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
                        addDepartment(_departmentController.text);
                      },
                      child: Text("Add"),),
                  SizedBox(height: 20,),
                  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //title: Text(departments[index]),
                    leading: Icon(Icons.abc),
                    title: Text("data"),
                    onTap: () {
                      
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
void addDepartment(String dept){
  setState(() {
    departments.add(dept);
  });
}
  }
  

