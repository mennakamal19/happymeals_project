import 'package:flutter/material.dart';
import 'package:happymeals_project/account.dart';
import 'package:happymeals_project/offers.dart';
import 'package:happymeals_project/resturants.dart';
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  final List<Widget> bottomNavigationItems =
  [
    Restaurants(),
    Offers(),
    Account()
  ];
  onTappedBar(int index)
  {
    setState(()
    {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded,
            ),
            label:
            'Restaurants',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_rounded,
              ),
              label: 'Offers'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded,
              ),
              label: 'Account'
          ),
        ],
      ),
      body: bottomNavigationItems[_currentIndex],
    );
  }
}
