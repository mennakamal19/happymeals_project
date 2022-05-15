import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happymeals_project/filters.dart';
import 'package:happymeals_project/main_restaurant.dart';
import 'package:happymeals_project/support_center.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  var searchController = TextEditingController();
  List restaurantsList = [];
  @override
  void initState() {
    getRestaurantsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx)=>)),
            child: Row(
              children:<Widget> [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: InkWell(
                      //onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SearchDetails())),
                      child: TextField(
                        cursorColor:Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: 'Search',
                            fillColor: Colors.grey[300],
                            filled: true,
                            prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.secondary,),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.sort,
                    color: Theme.of(context).colorScheme.secondary),
                  onPressed: ()

                  {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Filters()));
                  },
                )
              ],
            ),
          ),
        ),
        body: restaurantsList.length !=0? SingleChildScrollView(
          child: Column(
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:<Widget> [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          'Popular Choices',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18.0,
                              fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Show all',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 210.0,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index) => popularChoices()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children:<Widget> [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          'New Restaurants',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Show all',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              ListView.builder(
                itemCount: restaurantsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index)=>newRestauramts(restaurantsList[index]),
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ): Center(child: CircularProgressIndicator())
    );
  }
  Widget popularChoices() => InkWell(
    onTap: ()
    {
      //Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MainRestaurant()));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:<Widget> [
          Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0)
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network('https://media.timeout.com/images/105422478/image.jpg',
              fit: BoxFit.cover,),
          ),
          SizedBox(height: 7.0,),
          Text(
              'Fast Burgers'
          ),
          Row(
            children:<Widget> [
              Text(
                'Cafe-Western Food',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 7.0,),
              Icon(Icons.star,
                color: Theme.of(context).colorScheme.secondary,
                size: 12.0,
              ),
              Text(
                '4.9',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
  Widget newRestauramts(list)=>  InkWell(
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MainRestaurant(list: list,)));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children:<Widget> [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 90.0,
                  height: 100.0,
                  child: Image.asset(list['image'],fit: BoxFit.cover,)
              ),
              SizedBox(width: 15.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text(
                      list['name'],
                      style: TextStyle(
                        fontSize: 16.0,
                      )
                  ),
                  Text(
                      list['type'],
                      style: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                  Row(
                    children:<Widget> [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 14,
                      ),
                      SizedBox(width: 2,),
                      Text(
                          list['rate'],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0,),
          Divider(height: 2.0,color: Colors.grey[300]),
          SizedBox(height: 8.0,)
        ],
      ),
    ),
  );
  getRestaurantsData()
  {
    CollectionReference restaurants = FirebaseFirestore.instance.collection('Restaurant');
    restaurants.snapshots().listen((value)
    {
      restaurantsList = value.docs;
      setState(()
      {

      });
    });
  }
}
