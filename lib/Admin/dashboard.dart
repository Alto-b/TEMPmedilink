// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medilink/Admin/departments.dart';
import 'package:medilink/Admin/doctor.dart';
//import 'Widgets/bnb.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:
           Text("DASHBOARD"),
           centerTitle: true,
           actions: [
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.refresh))
           ],
           ),

      //body

      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 50,),

            Text("data"),
            Image.asset('medilink.png',height: 200,),

            SizedBox(height: 50,),
             //Appointments
            ListTile(
              leading: Icon(Icons.book_online),
              title: Text("Appointments"),
              onTap: () {
                
              },
            ),
            //stats
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Statistics"),
              onTap: () {
                
              },
            ),
             //Department
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Department"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DepartmentPage(),));
              },
            ),
             //Doctors
            ListTile(
              leading: Icon(Icons.group_add_sharp),
              title: Text("Doctors"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorPage(),));
              },
            ),
             //Feedback
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedbacks"),
              onTap: () {
                
              },
            ),
          ],
        ),
        
      ),
     // bottomNavigationBar: AdminNavBar( ),
    );
  }
}