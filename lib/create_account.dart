import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happymeals_project/home.dart';
import 'package:happymeals_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
{
  var userNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();
  var userPhoneController = TextEditingController();
  final _userformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          shadowColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios,
            color: Colors.black,size: 18.0,)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text('Create your\naccount',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: Form(
                  key: _userformkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget> [
                      TextFormField(
                          controller: userNameController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                              hintText: 'username',
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                          validator: (username){
                            if(username!.isEmpty)
                            {
                              return "please enter your username";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                          controller: userEmailController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(12.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (email){
                            if(email!.isEmpty)
                            {
                              return "please enter your Email";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                          controller: userPasswordController,
                          obscureText: true,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                          validator: (password){
                            if(password!.length<8)
                            {
                              return "please enter password more than 8 character";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                          controller: userPhoneController,
                          cursorColor:Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                              hintText: 'Phone',
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (phone){
                            if(phone!.isEmpty)
                            {
                              return "please enter your phone";
                            }
                            return null;
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0),
                    color: Theme.of(context).colorScheme.secondary
                ),
                child: TextButton(
                  onPressed: ()
                  {
                    if(_userformkey.currentState!.validate())
                    {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: userEmailController.text,
                          password: userPasswordController.text
                      ).then((value)
                      async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('userID', value.user!.uid);
                        setState(()
                        {
                          addUsers(userNameController.text,userEmailController.text,userPhoneController.text,value.user!.uid);
                        });
                      }).catchError((e)
                      {
                        Fluttertoast.showToast(msg:e.toString(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                      });
                    }
                  },
                  child: Text('Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text('By Clicking sign up you agree to the our Terms and Conditions',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            SizedBox(height: 20.0,),
            //Spacer(flex: 1,), dose not working with single child scroll view
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text('Already an account?'),
                  SizedBox(width: 10.0),
                  GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Login()));
                      },
                      child: Text('Log in',style: TextStyle(color: Theme.of(context).colorScheme.secondary),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addUsers(name, email, phone, id )
  {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    users..doc(id).set(
        {
          'user_name':name,
          'email':email,
          'phone':phone,
          'uid':id,
          'image':''
        }).then((value)
    {
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyHome()));

    }).catchError((e)
    {
      Fluttertoast.showToast(msg:e.toString(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
    });
  }
}
