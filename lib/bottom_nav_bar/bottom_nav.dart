import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wellnex/homepage/diet_plan.dart';
import 'package:wellnex/homepage/male_homepage.dart';
import 'package:wellnex/homepage/meditation.dart';
import 'package:wellnex/homepage/my_progress.dart';
import 'package:wellnex/profile_page/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages=[
    HomeMale(),
    DietPlan(),
    MeditationPage(),
    ProgressPage()
  ];
  var _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Profile(),
      appBar: AppBar(
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        items: [
        Icon(Icons.fitness_center_sharp,color: Colors.white),
        Icon(Icons.food_bank_sharp,color: Colors.white,),
        Icon(Icons.mediation,color: Colors.white,),
        Icon(Icons.bar_chart,color: Colors.white,),
      ],
      onTap: (index){
        setState(() {
          _currentIndex=index;
          print(_currentIndex);
        });
      },
      ),
      body: _pages[_currentIndex],
    );
  }
}
