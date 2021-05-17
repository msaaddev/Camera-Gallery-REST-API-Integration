import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:assignment6/image_gallery.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  Homepage createState() => Homepage();
}

class Homepage extends State<Home> {
  File _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Card(
              child: Center(
                  child: Container(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: InkWell(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Column(
                                children: [
                                  if (_imageFile != null) ...[
                                    Image.file(_imageFile,
                                        height: 200, width: 200)
                                  ] else ...[
                                    Image.network(
                                      'https://i.pinimg.com/originals/bc/aa/d0/bcaad00d4bf16fd94bc45665ddad18e9.jpg',
                                      height: 200,
                                      width: 200,
                                    ),
                                  ],
                                ],
                              )),
                          onTap: () async {
                            return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text('Choose an option',
                                      style: TextStyle(
                                        fontSize: 30,
                                      )),
                                  content: Text('Camera or Gallery'),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await _pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.photo_camera,
                                          size: 20,
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          await _pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.image,
                                          size: 20,
                                        )),
                                  ],
                                );
                              },
                            );
                          },
                        )),
                    Row(
                      children: [
                        Container(
                            width: 150,
                            margin:
                                EdgeInsets.only(left: 30, top: 20, bottom: 20),
                            child: ElevatedButton(
                              child: Text('Clear',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent[700],
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shadowColor: Colors.blueAccent),
                              onPressed: () {
                                setState(() {
                                  _imageFile = null;
                                });
                              },
                            )),
                        Container(
                            width: 150,
                            margin: EdgeInsets.only(
                                left: 10, top: 20, bottom: 20, right: 30),
                            child: ElevatedButton(
                              child: Text('Upload',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent[700],
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shadowColor: Colors.blueAccent),
                              onPressed: () {},
                            ))
                      ],
                    )
                  ],
                ),
              )),
            ))
      ],
    );
  }
}
