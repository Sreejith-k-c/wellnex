import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MeditationPage extends StatefulWidget {
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  int meditationDuration = 5;
  bool isMeditating = false;
  int remainingTime = 0;
  late TextEditingController durationController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    durationController =
        TextEditingController(text: meditationDuration.toString());
    remainingTime = meditationDuration * 60;
  }

  @override
  void dispose() {
    durationController.dispose();
    super.dispose();
  }

  void startMeditation() {
    setState(() {
      isMeditating = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          stopMeditation();
        }
      });
    });
  }

  void stopMeditation() {
    setState(() {
      isMeditating = false;
      remainingTime = meditationDuration * 60;
    });

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 260,
                    child: Lottie.asset(
                        "assets/lottie_animations/Animation - 1709009667963.json")),
              ),
              Text(
                'Set Meditation Duration (minutes)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(87, 255, 193, 7),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          controller: durationController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              meditationDuration = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: (){
                          isMeditating ? null : startMeditation();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.white,
                            ),
                            child: Center(child: Text("Start Meditation",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Remaining Time: ${remainingTime ~/ 60} min ${remainingTime % 60} sec',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                       InkWell(
                        onTap: (){
                          stopMeditation();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.white
                            ),
                            child: Center(child: Text("Stop Meditation",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
