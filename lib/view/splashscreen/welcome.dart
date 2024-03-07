import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnex/view/bottom_nav_bar/bottom_nav.dart';
import 'package:wellnex/view/splashscreen/splash.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

Future<bool> getsharepref()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
bool login = await prefs.getBool('login') ?? false;
return login;
}

Future<void> initializeApp(var context) async {
  bool logincheck = await getsharepref();
  Future.delayed(Duration(seconds: 3)).then((value) =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
          logincheck == true ? BottomNavigation() : SplashScreen())));
}

class _welcomeState extends State<welcome> {
  @override
  void initState() {
   initializeApp(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius:120, backgroundImage: AssetImage("assets/fitness.jpg")
                  ),
              SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

