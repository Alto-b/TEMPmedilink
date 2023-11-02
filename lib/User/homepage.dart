// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medilink/User/Pages/mainpage.dart';
import 'package:medilink/User/Pages/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexNum = 0;

  List screen = [
    MainPage(),
    ProfilePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      // appBar: AppBar(
      //   toolbarHeight: 90,
      //   title: Image.network(
      //     'https://i.ibb.co/YZWjL9Y/Screenshot-2023-10-22-204311-removebg-preview.png',
      //     width: 120,
      //   ),
      //   centerTitle: true,
      // ),

      body:screen.elementAt(indexNum),



      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFFF4F5F6),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Hospitals",
            backgroundColor: Color(0xFFF5F5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Color(0xFFF8F9FA),
          ),
          
        ],
        currentIndex: indexNum,
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromRGBO(33, 150, 243, 1),
        unselectedItemColor: Color(0xFF6D6D6D),
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
     

    );
}
}