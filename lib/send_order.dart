
import 'package:flutter/material.dart';
import 'package:happymeals_project/home.dart';
import 'package:happymeals_project/track_your_order.dart';
class SendOrder extends StatefulWidget {
  final String total,delivery_cost;

  SendOrder({required this.total,required this.delivery_cost});
  @override
  _SendOrderState createState() => _SendOrderState();
}

class _SendOrderState extends State<SendOrder> {
  late String finalTotal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getTotal(widget.total,widget.delivery_cost);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        titleSpacing: 0.0,
        leading: IconButton(onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_rounded,
            color: Colors.black,size: 18,),
        ),
        title: Text('Check out',
          style: TextStyle(
              color: Colors.black,fontSize: 16
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text('Delivery Address'),
            SizedBox(height: 5),
            Row(
              children:<Widget> [
                Expanded(
                    child: Text('64 zahraa nasr city,\ncairo,Egypt',style: TextStyle(fontWeight: FontWeight.bold),)),
                Text('Change',style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(indent: 20,endIndent: 20,),
            ),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Payment Method'),),
                Text('Add +',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.grey[100],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children:<Widget> [
                  Icon(Icons.payment_rounded,color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 10,),
                  Text('**** **** **** 1233'),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.grey[100],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children:<Widget> [
                  Icon(Icons.payments_rounded,color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 10,),
                  Text('mennakk@gmail.com'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Enter Coupon'),),
                Text('HUNGRY10',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(indent: 20,endIndent: 20,),
            ),
            Text('Summary',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 12,),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Subtotal'
                  ),
                ),
                Text(widget.total +' Eg',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Delivery Cost'
                  ),
                ),
                Text(widget.delivery_cost+' Eg',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Discount'
                  ),
                ),
                Text('15'+' Eg',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(indent: 20,endIndent: 20,),
            ),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text('Total'
                  ),
                ),
                Text(finalTotal+' Eg',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Theme.of(context).colorScheme.secondary),)
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color:Theme.of(context).colorScheme.secondary,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: TextButton(
                  onPressed: (){
                    sendOrder();
                  },
                  child: Text('Send Order',
                    style: TextStyle(
                        color: Colors.white
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
  getTotal(String total, String delivery_cost)
  {
    var result;
    if(delivery_cost == 'Free')
    {
      result = (int.parse(total) -15).toString();
    }else{
      result = ((int.parse(total)+int.parse(delivery_cost))-15).toString();
    }
    setState(() {
      finalTotal = result;
    });
    return finalTotal;
  }
  sendOrder()
  {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                Image.network('https://www.iconninja.com/files/989/602/415/yes-circle-mark-check-correct-tick-success-icon.png'),
                Text('Thank you for\nyour order.',textAlign:TextAlign.center,style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 18,color: Theme.of(context).colorScheme.secondary,
                ),),
                SizedBox(height: 15,),
                Text('you can track the delivery in\nthe"Order section".',textAlign:TextAlign.center,style: TextStyle(
                    fontSize: 14,color: Colors.grey
                ),),
                Spacer(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>TrackOrder()));
                    },
                    child: Text('Track my order',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyHome()));
                    },
                    child: Text('Order something else',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          )
      ),
    );
  }
}
