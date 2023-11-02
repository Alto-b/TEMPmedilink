// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medilink/Admin/Widgets/bnb.dart';
import 'package:medilink/Admin/departments.dart';
import 'package:medilink/Admin/doctor.dart';
import 'package:medilink/Admin/doctorlist.dart';
import 'package:medilink/Admin/statistics.dart';
import 'package:medilink/Guest/login.dart';
import 'package:intl/intl.dart';

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
  color:Color.fromARGB(255, 0, 0, 0),
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
      (context) => StatisticsPage(),
      (context) => DepartmentPage(),
      (context) => DoctorPage(),
      (context) => DoctorPage(),
      (context) => StatisticsPage(),
    ];

List<Color> colors=[
  Color.fromARGB(120, 12, 97, 15),
  Color.fromARGB(136, 215, 140, 20),
  Color.fromARGB(122, 9, 215, 67),
  Color.fromARGB(123, 72, 8, 176),
  Color.fromARGB(106, 17, 115, 195),
  Color.fromARGB(100, 199, 113, 14),
];

//  String getCurrentDateTime() {
//   final now = DateTime.now();
//   final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
//   return formatter.format(now);
// }

//  DateTime currentTime = DateTime.now();

//   @override
//   void initState() {
//     super.initState();

//     // Start a timer to refresh the time every second
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       // Update the current time
//       setState(() {
//         currentTime = DateTime.now();
//       });
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:
          Text(" "),
           centerTitle: true,
          //  actions: [
          //   IconButton(onPressed: () {
          //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
          //   }, icon: Icon(Icons.logout))
          //  ],
           ),
     // bottomNavigationBar: AdminNavBar( ),
      
    //drawer
     drawer: Drawer(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text("Admin"), 
          //   accountEmail: Text(""),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: NetworkImage('https://cdn3.iconfinder.com/data/icons/user-group-black/100/user-process-512.png'),
          //     backgroundColor: Color.fromARGB(255, 255, 255, 255),
          //   ),),
          SizedBox(height: 20,),
          ListTile(
            minVerticalPadding: 50,
            leading: Image.network('https://cdn3.iconfinder.com/data/icons/user-group-black/100/user-process-512.png'),
            title: Text("Admin"),
            tileColor: Color.fromARGB(255, 211, 211, 211),
          ),
          SizedBox(height: 20,),
          //dashboard
            ListTile(
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
              },
              title: Text("Dashboard"),
            ),
            //logour
            ListTile(
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
              },
              title: Text("Logout"),
            ),
            
        ],
      ),
     ),

     //body
     body: SingleChildScrollView(
       child: Padding(
        
         padding: const EdgeInsets.all(8.0),
         child: Expanded(
          
           child: Column(
             children: [
              SizedBox(height: 25,),
              //Image.asset('asset/images/medilink.png'),
              
              Image.network('https://i.ibb.co/YZWjL9Y/Screenshot-2023-10-22-204311-removebg-preview.png',
                width: 200,),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [

                          //hola text
                          Text("Welcome ",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700
                          ),),

                          //admin text
                          Text("Admin ",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700
                          ),),

                          // ! text
                          Text("! ",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700,
                            color: Colors.blue
                          ),),
                        ],
                      ),
                    //  Text(
                    //     DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime),
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30,),
               GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 10),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                       child: Container(
                        //color: Colors.amber,
                        decoration: BoxDecoration(color: colors[index],
                          border: Border.all(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                                  
                         child: GridTile(
                          //header: Text("data"),
                          footer: GridTileBar(
                                backgroundColor: Colors.black.withOpacity(0.2),
                                title: Text(titles[index],textAlign: TextAlign.center),
                                
                                
                              ),
                          child: 
                          // Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfogX5FQ6KXiExa5nBPZKI3cl0wAEjTysv-Q&usqp=CAU',
                          //     fit: BoxFit.cover,
                          //     ),
                          icons[index],),
                       ),
                     );
                   },),               
           ],
             
           ),
         ),
       ),
     ),
     
     persistentFooterButtons: [Center(child: Text("@MediLink 2023",style:TextStyle(color: Colors.grey),))],
    );
  }
}

