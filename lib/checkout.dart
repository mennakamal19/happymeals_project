import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happymeals_project/send_order.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOut extends StatefulWidget {
  final QueryDocumentSnapshot list;
  CheckOut({required this.list});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late String subTotal;
  late String finalTotal;
  late String id;
  List myBasket =[] ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBasketItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          titleSpacing: 0.0,
          leading: IconButton(onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black,size: 18,),
          ),
          title: Text('My Order',
            style: TextStyle(
                color: Colors.black,fontSize: 16
            ),
          ),
        ),
        body:myBasket.length!=0? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Row(
                children:<Widget> [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:Image.asset(widget.list['image'],width: 80,height: 90,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(widget.list['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text(widget.list['type'],
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      Row(
                        children:<Widget> [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).accentColor,
                            size: 15,
                          ),
                          SizedBox(width: 3,),
                          Text(widget.list['rate'],style: TextStyle(fontSize: 13
                          ),),
                          Text('(124 ratings)',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children:<Widget> [
                          Icon(
                            Icons.location_on_rounded,
                            color: Theme.of(context).accentColor,
                            size: 14,
                          ),
                          SizedBox(width: 3,),
                          Text(widget.list['location'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100]
                ),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        itemCount: myBasket.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context,idx)=>orderItem(myBasket,idx)
                    ),
                    Text('Add more foods',
                      style: TextStyle(
                          color: Theme.of(context).accentColor
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              Spacer(),
              Row(
                children:<Widget> [
                  Expanded(child: Text('Delivery instructions')),
                  Text('Add notes +',style: TextStyle(color: HexColor('#68B2A0')),),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children:<Widget> [
                  Expanded(
                    child: Text('Subtotal'
                    ),
                  ),
                  Text(subTotal + ' Eg',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children:<Widget> [
                  Expanded(
                    child: Text('Delivery cost'
                    ),
                  ),
                  Text(widget.list['delivery_cost']+ ' Eg',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Theme.of(context).accentColor,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SendOrder(total: subTotal,delivery_cost: widget.list['delivery_cost'],)));
                      });
                    },
                    child: Text('Check out',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ):Center(child: CircularProgressIndicator())
    );
  }
  Widget orderItem(List myBasket, int idx)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children:<Widget> [
        Text(myBasket[idx]['name']),
        SizedBox(width: 3,),
        Text('X '+'1'),
        Spacer(),
        Text(myBasket[idx]['price']+' Eg'),
      ],
    ),
  );
  Widget noorder()=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:<Widget> [
      Image.network('https://potenzaglobalsolution.files.wordpress.com/2015/07/ecommerce.png'),
      Text('Your basket is empty',style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold,fontSize: 16),),
      SizedBox(height: 20),
      Text('Make your basket happy and\nadd foods to it',textAlign: TextAlign.center,)
    ],
  );
  getBasketItems()
  async {
    CollectionReference basket = FirebaseFirestore.instance.collection('Basket');
    await SharedPreferences.getInstance().then((value)
    {
      id = value.getString('userID')!;
      basket.doc(id).collection('Order').get().then((value)
      {
        myBasket = value.docs;
        setState(() {
          getTotal(myBasket);
        });
      }).catchError((e)
      {
        print('-------> error ${e.toString()}');
      });
    });
  }
  getTotal(List myBasket)
  {
    var sum;
    for (var i = 0; i < myBasket.length; i++) {
      sum = int.parse(myBasket[i]!['price']);
      sum += sum;
    }
    setState(() {
      subTotal = sum.toString();
      print(subTotal);
    });
  }
}
