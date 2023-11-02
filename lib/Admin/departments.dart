// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:medilink/db/functions/db_functions.dart';
import 'package:medilink/db/model/data_model.dart';



class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {

 //late Box<DeptIns>  department=Hive.box<DeptIns>('department');

    final _departmentController=TextEditingController();
    final _formKey = GlobalKey<FormState>();

  Future<void> addDepartmentButton() async{
      final _dept=_departmentController.text.trim();
      if(_dept.isEmpty){
        return;
      }
      else{
      print('$_dept');

      final _department=DepartmentModel(dept: _dept);

      addDepartment(_department);
      }
    }
   
   
  @override
  Widget build(BuildContext context) {
    getDepartment();
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

             //textformfield     

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
            
            //button

                  ElevatedButton(
                      onPressed: () {
                        addDepartmentButton();
                        _departmentController.clear();
                      },
                  child: Text("Add"),
                ),
                  SizedBox(height: 20,),
                ],
              ),
              
              
              ),
              SizedBox(
                  height: 500,
                  child: ValueListenableBuilder(
                    valueListenable: deptListNotifier,
                    builder: (BuildContext ctx, List<DepartmentModel> departmentList,Widget? child) {
                      
                    
                    return ListView.separated(
                    itemBuilder:((context, index) {
                      final data=departmentList[index];

                      return Slidable(
                              endActionPane: ActionPane(
                                motion:DrawerMotion() ,
                             children: [
                              //edit
                              SlidableAction(onPressed: (context) {
                                //deleteDept(data.id!);
                              },
                              icon:Icons.edit,
                              //foregroundColor: Colors.blue,
                              backgroundColor: Color.fromARGB(255, 10, 112, 196),
                              ),
                              //delete
                              SlidableAction(onPressed: (context) {
                                deleteDept(data.id!);
                              },
                              icon:Icons.delete,
                              //foregroundColor: Colors.red,
                              backgroundColor: Color.fromARGB(255, 248, 3, 3),
                              ),
                             ]),
                           
                                     
    
                        child: Container(
                          child: ListTile(
                            horizontalTitleGap: 20,
                            contentPadding: EdgeInsets.all(5),
                            leading: Text("${index+1}"),
                            title: Text(data.dept),
                            //subtitle: Text("$index"),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                            //     IconButton(onPressed: (){
                            //       if(data.id !=null){
                            //         deleteDept(data.id!);
                            //         //deleteDept(index);
                            //         }
                            //         else{
                            //           print("dept id is null");
                            //         }
                            //     }, icon: Icon(
                            //            Icons.delete,
                            //              color: Colors.red[300],)
                            //     ),
                            //   ],
                            // ),
                          
                          ),
                        ),
                        
                      );
                    }) , 
                                  separatorBuilder: ((context, index) {
                    return const Divider();
                                  }), itemCount:departmentList.length);
                 }, ),
                ),
            ],       
          ),      
          
        ),
      ),
      
      
    );

    
  

  }

}
