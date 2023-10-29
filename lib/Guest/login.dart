// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:medilink/Guest/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),

      //body
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: [
                SizedBox(height: 50,),
                     TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "Email"),
                    ),
                    //confirm password
                    SizedBox(height: 30,),
                     TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "Password"),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){}, child: Text("Login")),
                    SizedBox(height: 40,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                    }, child: Text("New to MediLink",
                    //style: TextStyle(color: Colors.grey[500]),
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
                    }, child: Text("DASHBOARD"))
              ],
            ),
        ),
      )

    );
  }
}