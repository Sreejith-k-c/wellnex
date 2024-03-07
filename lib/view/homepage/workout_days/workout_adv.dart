import 'package:flutter/material.dart';
import 'package:wellnex/view/homepage/workout_days/workout_progress.dart';

class WorkOutAdv extends StatefulWidget {
  const WorkOutAdv({super.key, required this.excercise});
  final List excercise;
  @override
  State<WorkOutAdv> createState() => _WorkOutAdvState();
}

class _WorkOutAdvState extends State<WorkOutAdv> {
int currentExerciseIndex = 0;
  double progress = 0.0;

  void updateProgress() {
    setState(() {
      progress = (currentExerciseIndex + 1) / widget.excercise.length;
    });
  }

  void goToNextExercise() {
    setState(() {
      if (currentExerciseIndex < widget.excercise.length - 1) {
        currentExerciseIndex++;
      }
    });
    updateProgress();
  }

  String getNextButtonText() {
    if (currentExerciseIndex == widget.excercise.length - 1) {
      return "Done";
    } else {
      return "Next >>>";
    }
  }

  void navigateToProgressPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutProgressPage(progress: progress),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: widget.excercise.isEmpty
                  ? Center(
                      child: Text(
                        "No exercises for  Today",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(widget.excercise[currentExerciseIndex]['images']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.excercise[currentExerciseIndex]['name'],
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.excercise[currentExerciseIndex]['sets'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if (currentExerciseIndex == widget.excercise.length - 1) {
                          navigateToProgressPage();
                        } else {
                          goToNextExercise();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            getNextButtonText(),
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}