// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medilink/Admin/departments.dart';
import 'package:medilink/Admin/doctor.dart';
import 'package:medilink/Admin/doctorlist.dart';
import 'package:medilink/Guest/login.dart';
//import 'Widgets/bnb.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

List<String> titles=[
  'Appointments',
  'Statistics',
  'Department',
  'Doctors',
  'Doctors list',
  'Feedback',
  
];

List<Icon> icons=[
 Icon(
    Icons.book_online,
  size:50,
  color:Colors.black,
  ),
  Icon(
    Icons.analytics,
  size:50,
  color:Colors.black,
  ),
  Icon(
    Icons.local_hospital_outlined,
  size:50,
  color:Colors.black,
  ),
  Icon(
    Icons.group_add,
  size:50,
  color:Colors.black,
  ),
  Icon(
    Icons.group,
  size:50,
  color:Colors.black,
  ),
  Icon(
    Icons.feedback,
  size:50,
  color:Colors.black,
  ),
];

final List<WidgetBuilder> pageBuilders = [
      (context) => DoctorPage(),
      (context) => DoctorListPage(),
      (context) => DoctorPage(),
      (context) => DoctorListPage(),
      (context) => DoctorPage(),
      (context) => DoctorListPage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:
           Text("Admin Dashboard"),
           centerTitle: true,
           actions: [
            IconButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            }, icon: Icon(Icons.logout))
           ],
           ),
     // bottomNavigationBar: AdminNavBar( ),

     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Expanded(
         child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,crossAxisSpacing: 8),
            itemCount: 6,
             itemBuilder: (BuildContext context, int index) {
               return InkWell(
                onTap:() {
                 //print("tapped");
                 Navigator.of(context).push(
                  MaterialPageRoute(builder:pageBuilders[index],)
                 );
                }, onLongPress: () {
                  //print("long pressed");
                },
                 child: GridTile(
                  footer: GridTileBar(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        title: Text(titles[index],textAlign: TextAlign.center),
                        
                        
                      ),
                  child: 
                  // Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfogX5FQ6KXiExa5nBPZKI3cl0wAEjTysv-Q&usqp=CAU',
                  //     fit: BoxFit.cover,
                  //     ),
                  icons[index],),
               );
             },),
       ),
     ),
     persistentFooterButtons: [Center(child: Text("@MediLink 2023",style:TextStyle(color: Colors.grey),))],
    );
  }
}