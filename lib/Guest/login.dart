// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medilink/Admin/dashboard.dart';
import 'package:medilink/Guest/signup.dart';
import 'package:medilink/Guest/userBox.dart';
import 'package:medilink/User/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:medilink/db/model/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final userBox = Hive.box<UserBox>('users');
      final user = userBox.values.firstWhere(
        (user) => user.email == email && user.password == password,
        //orElse: () => User(), // You can define a default user model here
      );

      if (user.email.isNotEmpty) {
        // Successfully logged in. You can navigate to another screen or perform actions.
        print('Logged in as: ${user.email}');
      } else {
        // Show an error message since the login failed.
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Invalid email or password. Please try again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Login"),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                Image.network('https://i.ibb.co/YZWjL9Y/Screenshot-2023-10-22-204311-removebg-preview.png',
                width: 200,),
                SizedBox(height: 40,),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    // You can add more email validation here
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter email",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    // You can add more password validation here
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                // ElevatedButton(
                //   onPressed:
                //   // login,
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
                //   ,child: Text("Login"),
                // ),
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage(),));
                }, child: Text("Login")),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));

              }, child: Text("Sign up")),
              TextButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));

              }, child: Text("dashboard"))
              ],
            ),
          ),
        ),
      ),
//floating action button to dialer
                  floatingActionButton:  FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.red[300],
                onPressed: () {
                  _launchDialer('123456789'); // Replace '123456789' with the specific number
                },
                child: Icon(Icons.local_hospital,color: Colors.white,), // Use the ambulance icon
              )

                  

                  );
                }

        
   
  }
  //launch dialer
              _launchDialer(String phoneNumber) async{
                 Uri phoneno = Uri.parse('tel:108');
               if (await launchUrl(phoneno)) {
                      //dialer opened
                      }else{
                    SnackBar(content: Text("error loading dialer"));
                         }
                                } 



