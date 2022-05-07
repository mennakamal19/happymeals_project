import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happymeals_project/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainRestaurant extends StatefulWidget
{
  final QueryDocumentSnapshot list;
  MainRestaurant({required this.list});

  @override
  _MainRestaurantState createState() => _MainRestaurantState();
}

class _MainRestaurantState extends State<MainRestaurant> {
  List field_one_list = [];
  List field_two_list = [];
  late String id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String field_one = widget.list['field_one'];
    String field_two = widget.list['field_two'];
    String res_id = widget.list['id'];
    getMenuFirstField(res_id,field_one);
    getMenuSecondField(res_id,field_two);
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      floatingActionButton:Container(
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CheckOut(list: widget.list,)));
          },
          child: Text('Add to basket',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        leading: IconButton(icon: Icon(
          Icons.keyboard_arrow_left,color: Colors.white,),
          onPressed: () =>Navigator.pop(context),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body:
      SingleChildScrollView(
        child:
        Column(
          children:<Widget> [
            SizedBox(height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                ),
              ),
              child: Column(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children:<Widget> [
                        Text(widget.list['name'],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children:<Widget> [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.secondary,size: 16,
                        ),
                        Text(widget.list['rate']+'(124 ratings) '+widget.list['type'],
                          style: TextStyle(
                              color: Colors.grey
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.secondary,size: 16,
                        ),
                        Flexible(
                          child: Text(widget.list['location'],
                            style: TextStyle(
                                color: Colors.grey
                            ),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(widget.list['field_one'], // hana el mafrood an and HAHOD KELMT EL CHIld wa a7otha
                                style:TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            ListView.builder(
                                itemCount: field_one_list.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index) =>foodItem(field_one_list,index)
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(widget.list['field_two'], // hana el mafrood an and HAHOD KELMT EL CHIld wa a7otha
                                style:TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: ListView.builder(
                                  itemCount: field_two_list.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context,index) =>foodItem(field_two_list,index)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodItem(List<dynamic> food, int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:<Widget> [
            Row(
              children:<Widget> [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(food[index]['image'],height: 50,width: 45,fit: BoxFit.cover)),
                SizedBox(width: 8,),
                Expanded(
                  child: Text(food[index]['name'],
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(food[index]['price'],
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ],
            ),
            Row(
              children:<Widget> [
                Expanded(
                  child: Text(food[index]['componets'],
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ), onPressed: () { addToBasket(food[index]);  },
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
  getMenuFirstField(id, field_one)
  {
    print(id);
    FirebaseFirestore.instance
        .collection('Restaurant')
        .doc(id)
        .collection('Menu')
        .doc('hbFlzf4h0YtXYA2d8VMw')
        .collection(field_one)
        .snapshots()
        .listen((value)
    {
      field_one_list = value.docs;
      setState(()
      {

      });
    });
  }
  getMenuSecondField(id, field_two)
  {
    FirebaseFirestore.instance
        .collection('Restaurant')
        .doc(id)
        .collection('Menu')
        .doc('hbFlzf4h0YtXYA2d8VMw')
        .collection(field_two)
        .snapshots()
        .listen((value)
    {
      field_two_list = value.docs;
      setState(()
      {

      });
    });

  }
  addToBasket(food) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Basket');
    await SharedPreferences.getInstance().then((value)
    {
      id = value.getString('userID')!;
      users.doc(id).collection('Order')..doc().set(
          {
            'name':food['name'],
            'price':food['price'],
            'counter':1,
          }).then((value)
      {
        Fluttertoast.showToast(msg:'Item added successfully', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);

      }).catchError((e)
      {
        Fluttertoast.showToast(msg:e.toString(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
      });

    });


  }
}
