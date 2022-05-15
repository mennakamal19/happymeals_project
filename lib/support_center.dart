import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happymeals_project/support_chat.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16,color: Colors.black,), onPressed: ()=>Navigator.pop(context),),
        title: Text('Support',style: TextStyle(fontSize: 17,color: Colors.black),),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: TextField(
                  cursorColor:Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'Search',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children:<Widget> [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget> [
                          Text('Live chat with\nour support',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,fontSize: 18
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SupportChat()));
                              },
                              child: Text('Start',
                                style: TextStyle(
                                    color: Colors.white,fontSize: 12
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Image.network('https://t4.ftcdn.net/jpg/03/28/24/17/240_F_328241701_rWgSQ1NoMLYv9i7oumkufE5F593SMdw3.jpg',width: 110,height: 100,))
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text('Frequently asked questions',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 5),
                    defultQuestion('My order didn\'nt delivered'),
                    defultQuestion('My order came with missing items'),
                    defultQuestion('Change my phone number'),
                    defultQuestion('Change my delivery address'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text('Payment Methods',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    defultQuestion('How do i change payment method'),
                    defultQuestion('Can i refund my order ?'),
                    defultQuestion('I filled my visa number wrong'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget defultQuestion( text)=>Column(
    children:<Widget> [
      Row(
        children:<Widget> [
          Expanded(
            child: Text(text),
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
    ],
  );
}
