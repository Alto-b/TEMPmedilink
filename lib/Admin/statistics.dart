import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medilink/db/functions/db_functions.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      //appbar
      appBar: AppBar(
        title: Text("Statistics"),
        centerTitle: true,
      ),

      //body

      body: Row(
        
      )

    );
  }


}