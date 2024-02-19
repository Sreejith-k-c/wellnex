import 'package:flutter/material.dart';

class SplashTwo extends StatelessWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/alexander-jawfox-Kl2t5U6Gkm0-unsplash.jpg"),
            fit: BoxFit.cover,)
        ),
        child: 
            Container(
              alignment: Alignment(0, 0.50),
              child: Text("COMMIT TO BE FIT !",
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