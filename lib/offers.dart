import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text('Latest Offers',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Text('Find discount, offers,\nspecial meals and more!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('20 Restaurants',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )
              ),
              child:
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index )=> offerItem()
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget offerItem() => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children:<Widget> [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network('https://www.cairowestmag.com/wp-content/uploads/2019/11/Sushi-Circle-3-1024x683.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.0,),
        Text('Real Japanese Taste',
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5.0,),
        Row(
          children:<Widget> [
            Icon(Icons.star,
              color: Theme.of(context).accentColor,
              size: 18.0,
            ),
            SizedBox(width: 5.0,),
            Text(
              '4.9',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              '(124 ratings)',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 7.0,),
            Text(
              'Cafe - Western Food',
              style: TextStyle(
                color: Colors.grey,

              ),
            ),
          ],
        )
      ],
    ),
  );
}
