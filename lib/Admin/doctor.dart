// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {

    final _formkey = GlobalKey();
    final _nameController=TextEditingController();
    final _qualificationController=TextEditingController();

    //for image
    File? _selectedImage;

    //for dropdown
    List<String> items=['item1','item2'];
    String? selected='item1';

    //for dob
    DateTime dob=DateTime(2023,12,23);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text("Doctors"),
        centerTitle: true,
      ),

      //body
      body: Column(
        children: [
          SizedBox(height: 30,),
          //image picker
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color.fromARGB(255, 18, 18, 18)),
                    //borderRadius: BorderRadius.circular(10)
                  ),
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.fill,)
                      : Center(
                          child: Text(
                          'Add photo',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ))),
            ),
            Column(children: [
              IconButton(
                  onPressed: () {
                    _pickImage();
                  },
                  icon: Icon(Icons.photo_library_outlined),tooltip: "select from gallery",),
              IconButton(
                  onPressed: () {
                    _photoImage();
                  },
                  icon: Icon(Icons.camera_alt_outlined),tooltip: "open camera")
            ]),
          ]),
          //form start
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
            children: [
              //full name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Full Name"
                ),
              ),
              SizedBox(height: 10,),
               //qualification
              TextFormField(
                controller: _qualificationController,
                decoration: InputDecoration(
                  hintText: "Qualification"
                ),
              ),
              SizedBox(height: 10,),
               //specialization
              // DropdownButtonFormField(
              //   value: selected,
              //   items: items.map((items) => DropdownMenuItem(
              //     child: Text(items))).toList(),
              //    onChanged:(item) =>setState(()=>selected=item) ,
              //    )
               SizedBox(height: 10,),
               //dateofbirth
               Column(
                 children: [
                   Text("Date of birth"),
                   Text('${dob.year}/${dob.month}/${dob.day}'),
                   ElevatedButton(onPressed: ()async{
                    showDatePicker(context: context, 
                                  initialDate: DateTime.now(), 
                                  firstDate: DateTime(1900), 
                                  lastDate: DateTime(2023));
                   }, child: Text('select dob'))
                 ],
               ),
               

              

            ],
          )),
        )
         
        ],
      ),
    );
  }
  //IMAGE THROUGH CAMERA
Future<void> _photoImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

//IMAGE FROM PHOTOS
Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }
}