import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happymeals_project/create_account.dart';
import 'package:happymeals_project/forget_password.dart';
import 'package:happymeals_project/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  final _loginform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios,
            color: Colors.black,)
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text('Log in to your\naccount',
              style: TextStyle(
                  color: HexColor('#68B2A0'),
                  fontSize: 24.0
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _loginform,
              child: Column(
                children:<Widget> [
                  TextFormField(
                      controller: email,
                      cursorColor: HexColor('#68B2A0'),
                      decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)
                          )
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        if(email!.isEmpty)
                        {
                          return "Email cannot be empty";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                      controller: password,
                      cursorColor: HexColor('#68B2A0'),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(12.0),
                          suffixText: 'Forget ?',
                          suffixStyle: TextStyle(color: HexColor('#68B2A0')),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.keyboard_arrow_right,color: Theme.of(context).colorScheme.secondary,),
                            onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ForgotPassword()));
                            },
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)
                          )
                      ),
                      validator: (email){
                        if(email!.isEmpty)
                        {
                          return "Email cannot be empty";
                        }
                        return null;
                      }
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor('#68B2A0'),
                  borderRadius: BorderRadius.circular(50.0)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TextButton(
                onPressed: ()
                {
                  if(_loginform.currentState!.validate())
                  {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text
                    ).then((value)
                    async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('userID', value.user!.uid);
                      setState(()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyHome()));
                      });
                    }).catchError((e)
                    {
                      Fluttertoast.showToast(msg:e.toString(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                    });
                  }
                },
                child: Text('Log in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Do not have an account?'
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CreateAccount()));
                  },
                  child: Text('Sign up',style: TextStyle(
                      color: HexColor('#68B2A0')
                  ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}
