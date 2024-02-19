import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int waterIntakeCount = 0;
  final int targetIntake = 3;

  void incrementWaterIntake() {
    if (waterIntakeCount < targetIntake) {
      setState(() {
        waterIntakeCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            CircularProgressIndicator(
              strokeWidth: 100,
              value: waterIntakeCount / targetIntake,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Water Intake: $waterIntakeCount / $targetIntake litre',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                incrementWaterIntake();
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Add water intake(1L)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}