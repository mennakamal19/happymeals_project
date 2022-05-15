import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  SfRangeValues selectRange = SfRangeValues(20.0,80.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        titleSpacing: 0.0,
        leading: IconButton(onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_rounded,
            color: Colors.black,size: 16,),
        ),
        automaticallyImplyLeading: true,
        title: Text('Filters',
          style: TextStyle(
              color: Colors.black,fontSize: 16
          ),
        ),
        actions: [
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Reset',
              style: TextStyle(color: Colors.black,
                  fontSize: 15
              ),
            ),
          ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text('Sort by',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Most Popular',style: TextStyle(
                    color: Colors.grey
                ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey[300],
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Price High to Low',style: TextStyle(
                    color: Colors.grey
                ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey[300],
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Price Low to High',style: TextStyle(
                    color: Colors.grey
                ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey[300],
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Nearest to me',style: TextStyle(
                    color: Colors.grey
                ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Text('Cuisines',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              runSpacing: 10.0,
              children:
              [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('All',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Fast Food',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Japanese',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Pizza',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('American',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Thai',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Greek',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Italian',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Asian',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Dessert',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Mexican',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text('Price',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            SfRangeSlider(
              values: selectRange,
              min: 0.00,
              max: 100.00,
              showLabels: true,
              activeColor: Theme.of(context).colorScheme.secondary,
              numberFormat: NumberFormat('\$'),
              enableTooltip: true,
              onChanged: (dynamic newRange)
              {
                setState(() {
                  selectRange = newRange;
                });
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: TextButton(
                  onPressed: (){},
                  child: Text('Apply',
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
}
