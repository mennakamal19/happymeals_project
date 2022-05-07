import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailTextController = TextEditingController();
  final _useremail = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          shadowColor: Colors.transparent,
          leading: Icon(Icons.keyboard_arrow_left,
            color: Colors.black,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text('Forget password',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 25.0
              ),
            ),
            SizedBox(height: 20.0),
            Text('please enter your email to receive a link\nto create a new password via email.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
            Form(
              key: _useremail,
              child: TextFormField(
                  controller: emailTextController,
                  cursorColor: Theme.of(context).colorScheme.secondary,
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
            ),
            SizedBox(height: 15.0,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(50.0)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TextButton(
                onPressed: ()
                {
                  if(_useremail.currentState!.validate())
                  {
                    try {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email:emailTextController.text
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
