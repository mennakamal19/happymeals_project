import 'package:flutter/material.dart';
import 'package:happymeals_project/support_chat.dart';
import 'package:hexcolor/hexcolor.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,size: 16,color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0.0,
        title: const Text(
          'Track your order',
          style: TextStyle(fontSize: 16,color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SupportChat())),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text(
                  'Chat',style: TextStyle(
                    color:Theme.of(context).colorScheme.secondary
                ),
                ),
                SizedBox(width: 4.0),
                Icon(Icons.maps_ugc,color:  Theme.of(context).colorScheme.secondary,)
              ],
              ),
            ),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:<Widget> [
            Text(
                'Estimate Delivery Time'
            ),
            Text(
              '12:30PM',style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,fontSize: 20,fontWeight: FontWeight.bold
            ),
            ),
            Divider(),
            SizedBox(height: 50),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Theme.of(context).colorScheme.secondary),
                SizedBox(width: 15,),
                Text('Order confirmed',style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Colors.grey,),
                SizedBox(width: 15,),
                Text('Preparing your order',style: TextStyle(color: Colors.grey),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Colors.grey,),
                SizedBox(width: 15,),
                Text('Order is ready at the restaurant',style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Colors.grey,),
                SizedBox(width: 15,),
                Text('Rider is picking up your order',style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Colors.grey,),
                SizedBox(width: 15,),
                Text('Rider is nearby your place',style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.circle,size: 16,color: Colors.grey,),
                SizedBox(width: 15,),
                Text('Rider deliverd the order',style: TextStyle(color: Colors.grey))
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: TextButton(
                  onPressed: (){
                  },
                  child: Text('Cancel your order',
                    style: TextStyle(
                        color: Colors.black
                    ),
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
