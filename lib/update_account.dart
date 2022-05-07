import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile>
{
  late Map userData;
  late File imageFile;
  late String path,id;

  @override
  void initState()
  {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userData.length>1 ? Container(
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  GestureDetector(
                    onTap: ()
                    {
                      selectImage();
                    },
                    child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: userData['image'].length != 0? NetworkImage(userData['image']):
                        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtYyNP9njaEeggRjQ5MjX2PrJy1OHkN_o-FA&usqp=CAU')
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    userData['user_name'],
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    userData['email'],
                    style: TextStyle(
                        color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      onPressed: ()
                      {
                        uploadImage();
                      },
                      child: Text(
                        'UPDATE',style: TextStyle(
                          color: Colors.white
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ):Center(child: CircularProgressIndicator())
    );
  }
  getData() async
  {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    await SharedPreferences.getInstance().then((value)
    {
      id = value.getString('userID')!;
      users.doc(id).get().then((value)
      {
        userData = value.data() as Map<String, dynamic>;
        setState(() {

        });
      }).catchError((e)
      {
        print('-------> error ${e.toString()}');
      });
    });
  }

  selectImage() async
  {
    final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = File(selectedImage!.path);
    setState(() {

    });
  }

  uploadImage() async
  {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${imageFile.uri.pathSegments[imageFile.uri.pathSegments.length - 1]}')
        .putFile(imageFile).then((value) async
    {
      await value.ref.getDownloadURL().then((value)
      {
        CollectionReference users = FirebaseFirestore.instance.collection('Users');

        users.doc(id).update({
          'image': value.toString(),
        }).then((value)
        {
          getData();
        }).catchError((error)
        {
          print(error.toString());
        });
      });
    });
  }
}
