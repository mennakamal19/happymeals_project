import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportChat extends StatefulWidget {

  @override
  _SupportChatState createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {
  late var message =  TextEditingController();
  late String id;
  List messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text('Support',style: TextStyle(fontSize: 16),),
        titleSpacing: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16,), onPressed: ()=>Navigator.pop(context),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:<Widget> [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index)=> messageItem(messages,index),
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children:<Widget> [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: message,
                      style: TextStyle(decoration: TextDecoration.none),
                      cursorColor:Theme.of(context).accentColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: 'Type a message',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(width: 1,color: Theme.of(context).accentColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(width: 2,color: Theme.of(context).accentColor)
                        ),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.near_me_rounded,color: Theme.of(context).accentColor), onPressed: ()
                  {
                    sendMessage(message.text);
                    setState(() {

                    });
                  }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget messageItem(List messages, int index)=>Padding(
    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0,left: 50.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: messages[index]['if_image']?InkWell(onDoubleTap: ()
              {},
                  child:
                  Image.network(messages[index]['body'],width: 220,height: 250,fit: BoxFit.cover,)):
              Text(messages[index]['body'],
                style: TextStyle(color: Colors.black
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(12.0),
                  bottomStart:Radius.circular(12.0),
                  topStart: Radius.circular(12.0),
                )
            )
        ),
      ],
    ),
  );
  // Widget support()=>Padding(
  //   padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 50.0,left: 8.0),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(messages[index]['body']),
  //           ),
  //           decoration: BoxDecoration(
  //               color: Colors.grey[200],
  //               borderRadius: BorderRadiusDirectional.only(
  //                 bottomEnd: Radius.circular(12.0),
  //                 bottomStart:Radius.circular(12.0),
  //                 topEnd: Radius.circular(12.0),
  //               )
  //           )
  //       ),
  //     ],
  //   ),
  // );
  sendMessage(String text) async {
    message..text = '';
    await SharedPreferences.getInstance().then((value) {
      id = value.getString('userID')!;
      FirebaseFirestore.instance
          .collection('Users')
          .doc(id)
          .collection('Chats')
          .add({
        'body': text,
        'date_time': DateTime.now().toString(),
        'sender_id': id,
        'if_image':false
      }).then((value) {}).catchError((error) {});
    });
  }
  getMessage() async {
    await SharedPreferences.getInstance().then((value) {
      id = value.getString('userID')!;
      FirebaseFirestore.instance
          .collection('Users')
          .doc(id)
          .collection('Chats')
          .orderBy('date_time')
          .snapshots()
          .listen((value)
      {
        messages = value.docs;
        setState(()
        {

        });
      });
    });
  }
}

