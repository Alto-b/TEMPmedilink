// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medilink/Guest/stepper.dart';
import 'package:medilink/model/transactions.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(DeptInsAdapter());
  
  //await Hive.openBox('department');
  try {
  await Hive.openBox('department');
  // Access your box here
} catch (e) {
  print('Error accessing Hive box: $e');
}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      ///showPerformanceOverlay: true,

      title: 'Medilink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 160, 233)),
        useMaterial3: true,
      ),
      home: LoadingPage(),
    );
  }
}
