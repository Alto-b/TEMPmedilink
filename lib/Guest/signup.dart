// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medilink/Guest/login.dart';
import 'package:medilink/Guest/userBox.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

    final _formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AppBar(
        // title: Text("Signup"),
        // centerTitle: true,
      ),

      //body
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: [
                Form(
                  key:_formKey ,
                  child: Column(
                  children: [
                    //Text("Are you new here ?"),

                    // SizedBox(height: 20),
                Image.network('https://i.ibb.co/YZWjL9Y/Screenshot-2023-10-22-204311-removebg-preview.png',
                width: 200,),
                SizedBox(height: 20,),

                    //user name

                    SizedBox(height: 30,),
                     TextFormField(
                      controller: nameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return ' enter name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "Full name"),
                    ),
                    SizedBox(height: 30,),

                    //email textfield

                    TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "password"),
                      obscureText: true,
                    ),

                    //confirm password

                    SizedBox(height: 30,),
                     TextFormField(
                      controller: cpasswordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),hintText: "confirm password"),
                      obscureText: true,
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){
                      signUp();
                    }, child: Text("Signup")),
                    SizedBox(height: 40,),

                    //to login

                    TextButton(onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

                    },
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      
                     child: Text("Already have an account ?"))
                  ],
                ))
              ],
            ),
        ),
      )
    );
  }


void signUp() async {
  if (_formKey.currentState!.validate()) {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = cpasswordController.text;

    if (password == confirmPassword) {
      final userBox = Hive.box<UserBox>('users');
      final user = UserBox(name:name,email: email,password: password)
        ..name = nameController.text
        ..email = email
        ..password = password;

      userBox.add(user);
      print("added");
      
    } else {
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please try again"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("okay"))
            ],
          );
        });
    }
  }
}


}