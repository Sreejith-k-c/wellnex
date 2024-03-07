import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressBar extends StatefulWidget {
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double circularPercent = 0.0;
  int waterIntake = 0;
  bool isCompleted = false;

  double generateRandomPercent() {
    var random = Random();
    return random.nextDouble();
  }

  @override
  void initState() {
    super.initState();
    _loadWaterIntake();
  }

  void _loadWaterIntake() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      waterIntake = prefs.getInt('waterIntake') ?? 0;
      circularPercent = waterIntake / 10;
      isCompleted = circularPercent >= 1.0;
    });
  }

  void _increaseCircularPercent() async {
    setState(() {
      if (circularPercent < 1.0) {
        circularPercent += 0.1;
        if (circularPercent > 1.0) {
          circularPercent = 1.0;
        }
        waterIntake += 1;
        _saveWaterIntake();
        isCompleted = circularPercent >= 1.0;
      }
    });
  }

  void _resetCircularPercent() async {
    setState(() {
      circularPercent = 0.0;
      waterIntake = 0;
      _saveWaterIntake();
      isCompleted = false;
    });
  }

  void _saveWaterIntake() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('waterIntake', waterIntake);
  }

  int generateRandomDuration() {
    Random random = Random();
    return random.nextInt(501) + 1300;
  }

  int generateRandomLinearDuration() {
    Random random = Random();
    return random.nextInt(501) + 1300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Water intake rate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 130,
                  lineWidth: 30,
                  percent: circularPercent.clamp(0.0, 1.0),
                  progressColor: Colors.blue,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text((circularPercent * 100).toStringAsFixed(0) + "%"),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: isCompleted ? null : _increaseCircularPercent,
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: isCompleted ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Add water intake",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: _resetCircularPercent,
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Reset water intake",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Caloric Intake approximate rate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: generateRandomLinearDuration(),
                  lineHeight: 30,
                  percent: generateRandomPercent(),
                  progressColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
