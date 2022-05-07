import 'package:flutter/material.dart';
import 'package:happymeals_project/create_account.dart';
import 'package:happymeals_project/home.dart';
import 'package:happymeals_project/login.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget
{
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
{
  List<Slide>slides = [];
  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    slides.add(
      new Slide(
          pathImage:'images/bestintro.jpg',
          title: 'Find foods you love',
          styleTitle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,fontSize: 25.0,fontFamily: 'Roboto'
          ),
          description: 'Discover the best foods form over 1,000 restaurants',
          styleDescription: TextStyle(
              color: Colors.grey,fontSize: 14.0
          ),
          backgroundColor: Colors.transparent
      ),
    );
    slides.add(
        new Slide(
          pathImage:'images/bestfastdelivery.jpg',
          title: 'Fast Delivery',
          styleTitle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,fontSize: 25.0,fontFamily: 'Roboto'
          ),
          description:'Fast delivery to your home, office and wherever you are',
          styleDescription: TextStyle(
            color: Colors.grey,fontSize: 14.0
          ),
          backgroundColor: Colors.transparent,
        )
    );
    slides.add(
       Slide(
        pathImage: 'images/location.jpg',
        title:'Live Tracking' ,
        styleTitle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,fontSize: 25.0,fontFamily: 'Roboto'
        ),
        description:'Real time tracking of your food on the app after ordered',
        styleDescription: TextStyle(
          color: Colors.grey,fontSize: 14.0
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (ctx )=>Login()));},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Log in',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16.0
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:<Widget> [
          Expanded(
            child:
            IntroSlider(
              slides: this.slides,
              colorActiveDot: Theme.of(context).colorScheme.secondary,
              colorDot: Colors.grey,
              sizeDot: 10.0,
              showNextBtn: false,
              showSkipBtn: false,
              backgroundColorAllSlides: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).colorScheme.secondary,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CreateAccount()));
                },
                child: Text('Create Account',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.grey[200],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyHome()));
                },
                child: Text('Continue with Facebook',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
