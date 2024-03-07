import 'package:flutter/material.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/anastase-maragos-7kEpUPB8vNk-unsplash.jpg"),
            fit: BoxFit.cover)
        ),
        child: 
            Container(
              alignment: Alignment(0, 0.50),
              child: Text("WELLNEX",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w900
              ),),
            )
      ),
    );
  }
}