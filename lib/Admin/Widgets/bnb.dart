import 'package:flutter/material.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:medilink/Admin/departments.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});


  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {

  int indexNum=0;
  List Screen=[
     Dashboard(),
    DepartmentPage(),
  //   Dashboard(),
  //   Dashboard(),
  //  Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom navigation bar
      bottomNavigationBar:BottomNavigationBar(
        items: const [
          
          //item1
          BottomNavigationBarItem(
            icon:  Icon(Icons.home),
            label:"Home",
            backgroundColor: Color.fromARGB(255, 244, 245, 246)),
            
            //item2
            BottomNavigationBarItem(
            icon:  Icon(Icons.list_alt_outlined),
            label:"Orders",
            backgroundColor: Color.fromARGB(255, 245, 245, 245)),
           
            // //item3
            // BottomNavigationBarItem(
            // icon:  Icon(Icons.dashboard),
            // label:"Products",
            // backgroundColor: Color.fromARGB(255, 248, 249, 250)),
            
            // //item4
            // BottomNavigationBarItem(
            // icon:  Icon(Icons.auto_awesome_motion),
            // label:"Manage",
            // backgroundColor: Color.fromARGB(255, 253, 253, 253)),
            
            // //item5
            // BottomNavigationBarItem(
            // icon:  Icon(Icons.account_circle_sharp),
            // label:"Account",
            // backgroundColor: Color.fromARGB(255, 252, 252, 252)),
        ],
        currentIndex: indexNum, 
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromRGBO(33, 150, 243, 1),
        unselectedItemColor: Color.fromARGB(255, 109, 109, 109),

        onTap: (int index){
          setState(() {
            indexNum=index;
          });
        },
      ),
      body: Screen.elementAt(indexNum),
    );
  }
}