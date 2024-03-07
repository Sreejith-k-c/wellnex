import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MeditationMindfull extends StatefulWidget {
  @override
  _MeditationMindfullState createState() => _MeditationMindfullState();
}

class _MeditationMindfullState extends State<MeditationMindfull> {
  final int meditationDuration = 2;
  bool isMeditating = false;
  int remainingTime = 0;
  late Timer _timer;
  final player = AudioPlayer();

  Future<void> playSound() async {
    String audioPath = "music/binkuno.mp3";
    await player.play(AssetSource(audioPath));
  }

  @override
  void initState() {
    super.initState();
    remainingTime = meditationDuration * 60;
  }

  @override
  void dispose() {
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
      appBar: AppBar(),
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
              SizedBox(height: 20),
              Text(
                'Ready for meditation...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          isMeditating ? null : startMeditation();
                          playSound();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text("Start Meditation",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
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
                        onTap: () {
                          stopMeditation();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Text("Stop Meditation",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,)
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
