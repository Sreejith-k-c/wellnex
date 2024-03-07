import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wellnex/view/bottom_nav_bar/bottom_nav.dart';

class WorkoutProgressPage extends StatelessWidget {
  final double progress;

  const WorkoutProgressPage({Key? key, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Lottie.asset(
                  "assets/lottie_animations/Animation - 1709715934622.json"),
            ),
            Text(
              'Workout Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Progress: ${(progress * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigation()),
                      (route) => false);
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Finished!!!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
