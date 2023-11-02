// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, 
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medilink/User/Pages/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        toolbarHeight: 90,
        title: Image.network(
          'https://i.ibb.co/YZWjL9Y/Screenshot-2023-10-22-204311-removebg-preview.png',
          width: 120,
        ),
        centerTitle: true,
      ),

      body:Column(
      
        children: [

          SizedBox(height: 10,),

         //carousal  
         CarouselSlider(
          options: CarouselOptions(
            height: 200, 
            enlargeCenterPage: true, 
            aspectRatio: 16/9, 
            enableInfiniteScroll: true,
            autoPlay: true, 
            autoPlayInterval: Duration(seconds: 2), 
            autoPlayAnimationDuration: Duration(milliseconds: 800), 
            autoPlayCurve: Curves.fastOutSlowIn, 
            enlargeStrategy: CenterPageEnlargeStrategy.height, 
          ),
          items: [
            // Add your carousel items here, e.g., Container, Image, or any widget
            Container(
              //color: Colors.red,
              child: Center(child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe0Znt7YFpBi1X5ai8oHJyEcm1OosPVFNrIHdy2Al8GyigDUucqSI0tIrIcvgcEycjuwM&usqp=CAU')),
            ),
            Container(
              //color: Colors.blue,
              child: Center(child: Image.network('https://www.cvpdaytoneyedoctors.com/wp-content/uploads/2020/06/COVID-blog-large.jpg')),
            ),
            Container(
              //color: Colors.green,
              child: Center(child: Image.network('https://www.mountsinai.org/files/MSHealth/Assets/HS/About/Diversity/MSHS-DiversityEquityInclusion-ForbesDiversity2020-Carousel-1920x575-v2.jpg')),
            ),
          ],
        ),


        ],
      ),


  //floating action button to dialer
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[400],
        onPressed: () {
          _launchDialer('123456789'); // Replace '123456789' with the specific number
        },
        child: Icon(Icons.local_hospital, color: Colors.white), // Use the ambulance icon
      ),
    );
  }

  //launch dialer
  void _launchDialer(String phoneNumber) async{
           Uri phoneno = Uri.parse('tel:108000');
       if (await launchUrl(phoneno)) {
              //dialer opened
          }else{
          SnackBar(content: Text("couldn't launch dialer"));
      }
                  } 
}
