import 'package:flutter/material.dart';

class SplashThree extends StatelessWidget {
  const SplashThree({super.key});

  @override
  Widget build(BuildContext context) {
   return Material(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/edgar-castrejon-1SPu0KT-Ejg-unsplash.jpg"),
            fit: BoxFit.cover)
        ),
        child: 
            Container(
              alignment: Alignment(0, 0.60),
              child: Text("EAT THE BEST!!!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.bold
              ),),
            )
      ),
    );
  }
}