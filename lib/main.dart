// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medilink/Guest/stepper.dart';
import 'package:medilink/Guest/userBox.dart';
import 'package:medilink/db/model/data_model.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  //await Hive.openBox('dept_db');
   Hive.openBox<DepartmentModel>('dept_db');
   Hive.openBox<UserBox>('user_db');
  
  if(!Hive.isAdapterRegistered(DepartmentModelAdapter().typeId)){
      Hive.registerAdapter(DepartmentModelAdapter());
  }

  if(!Hive.isAdapterRegistered(UserBoxAdapter().typeId)){
      Hive.registerAdapter(UserBoxAdapter());
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 73, 179, 228)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 1
        )
      ),
      
      home: LoadingPage(),
    );
  }
}
