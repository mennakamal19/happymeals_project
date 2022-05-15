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
            icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black,size: 18,),
          ),
          title: const Text('My Order',
            style: TextStyle(
                color: Colors.black,fontSize: 16
            ),
          ),
        ),
        body:myBasket.isNotEmpty? Padding(
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
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(widget.list['name'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text(widget.list['type'],
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      Row(
                        children:<Widget> [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                          const SizedBox(width: 3,),
                          Text(widget.list['rate'],style: const TextStyle(fontSize: 13
                          ),),
                          const Text('(124 ratings)',
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
                            color: Theme.of(context).colorScheme.secondary,
                            size: 14,
                          ),
                          const SizedBox(width: 3,),
                          Text(widget.list['location'],
                            style: const TextStyle(
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
              const SizedBox(height: 20),
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
                          color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children:<Widget> [
                  const Expanded(child: const Text('Delivery instructions')),
                  Text('Add notes +',style: TextStyle(color: HexColor('#68B2A0')),),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children:<Widget> [
                  const Expanded(
                    child: Text('Subtotal'
                    ),
                  ),
                  Text(subTotal + ' Eg',style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children:<Widget> [
                  const Expanded(
                    child: Text('Delivery cost'
                    ),
                  ),
                  Text(widget.list['delivery_cost']+ ' Eg',style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SendOrder(total: subTotal,delivery_cost: widget.list['delivery_cost'],)));
                      });
                    },
                    child: const Text('Check out',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ):const Center(child: const CircularProgressIndicator())
    );
  }
  Widget orderItem(List myBasket, int idx)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children:<Widget> [
        Text(myBasket[idx]['name']),
        const SizedBox(width: 3,),
        const Text('X '+'1'),
        const Spacer(),
        Text(myBasket[idx]['price']+' Eg'),
      ],
    ),
  );
  Widget noorder()=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:<Widget> [
      Image.network('https://potenzaglobalsolution.files.wordpress.com/2015/07/ecommerce.png'),
      Text('Your basket is empty',style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold,fontSize: 16),),
      const SizedBox(height: 20),
      const Text('Make your basket happy and\nadd foods to it',
        textAlign: TextAlign.center,)
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
    var sum=0;
    var total =0 ;
    for (var i = 0; i < myBasket.length; i++)
    {
      sum = int.parse(myBasket[i]!['price']);
      total = total +sum;
    }
    setState(() {
      subTotal = total.toString();
    });
  }
}
