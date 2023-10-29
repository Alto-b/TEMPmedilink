// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medilink/Guest/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),

      //body
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: [
                Form(
                  
                  child: Column(
                  children: [
                    SizedBox(height: 30,),
                    //Text("Are you new here ?"),
                    SizedBox(height: 30,),
                    TextFormField(
                             validator: (value) {
                           if (value == null || value.isEmpty) {
                              return 'Email is required';
                           }
                          final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                                      caseSensitive: false,
                                      multiLine: false,
                                    );
                             if (!emailRegExp.hasMatch(value)) {
                                return 'Invalid email address';
                              }
                            return null; // Return null if the email is valid
                               },
        
                      
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "Enter email"),
                    ),
                    //password
                    SizedBox(height: 30,),
                     TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "password"),
                    ),
                    //confirm password
                    SizedBox(height: 30,),
                     TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "confirm password"),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){}, child: Text("Signup")),
                    SizedBox(height: 50,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    }, child: Text("Already have an account ?"))
                  ],
                ))
              ],
            ),
        ),
      )
    );
  }
}