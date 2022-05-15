import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happymeals_project/login.dart';
import 'package:happymeals_project/support_center.dart';
import 'package:happymeals_project/update_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account>
{
  Map userData = <String, dynamic>{};
  late String id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: userData.isNotEmpty?
      Column(
        children:<Widget> [
          Expanded(
            flex: 1,
            child:
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children:<Widget> [
                        CircleAvatar(
                            radius: 32.0,
                            backgroundImage: userData['image'].length != 0? NetworkImage(userData['image']):
                            NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtYyNP9njaEeggRjQ5MjX2PrJy1OHkN_o-FA&usqp=CAU')
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Text(
                              userData['user_name'],
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              userData['email'],
                              style: TextStyle(
                                  color: Colors.grey,fontSize: 14
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child:
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children:<Widget> [
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Profile'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UpdateProfile())); },
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Payment Method'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,),
                        onPressed: () {  },
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                          'Order History',
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,), onPressed: () {  },
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Delivery address'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,), onPressed: () {  },
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Settings'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,),
                        onPressed: ()
                        {
                         // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Setting()));
                        }
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'About us'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,), onPressed: () {  },
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Support Center'
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Support())),
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: Text(
                            'Logout'
                        ),
                      ),
                      IconButton(
                        onPressed: ()
                        {
                          FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Login())));
                        },
                        icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black,),
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
        ],
      ):Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,))
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
}
