import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnex/view/homepage/diet_plan.dart';
import 'package:wellnex/view/homepage/male_homepage.dart';
import 'package:wellnex/view/homepage/meditation.dart';
import 'package:wellnex/view/homepage/progress_page.dart';
import 'package:wellnex/view/profile_page/profile.dart';
import 'package:wellnex/view/splashscreen/welcome.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages = [
    HomeMale(),
    DietPlan(),
    MeditationPage(),
    ProgressBar(),
  ];

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => welcome()));
  }

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.logout,color: Colors.black),
              onPressed: (){
                showDialog(context: context,
                 builder: (BuildContext context) {
                   return AlertDialog(
                    title: Text("Logout?",style: TextStyle(fontWeight: FontWeight.bold),),
                    content: Text("If you logout, all your data will be erased!!!",style: TextStyle(
                      fontSize: 15
                    ),),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("cancel",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                      TextButton(onPressed: (){
                        _logout();
                      }, child: Text("Logout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)))
                    ],
                   );
                 });
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.fitness_center_sharp, color: Colors.white),
          Icon(Icons.food_bank_sharp, color: Colors.white),
          Icon(Icons.mediation, color: Colors.white),
          Icon(Icons.bar_chart, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
