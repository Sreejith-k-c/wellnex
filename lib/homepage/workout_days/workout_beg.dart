import 'package:flutter/material.dart';

class WorkOutBeg extends StatefulWidget {
  const WorkOutBeg({Key? key, required this.excercise}) : super(key: key);
  final List excercise;

  @override
  State<WorkOutBeg> createState() => _WorkOutBegState();
}

class _WorkOutBegState extends State<WorkOutBeg> {
  int currentExerciseIndex = 0;
  double progress = 0.0;

  // Function to update progress value
  void updateProgress() {
    setState(() {
      progress = (currentExerciseIndex + 1) / widget.excercise.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: widget.excercise.length + 1,
        onPageChanged: (index) {
          setState(() {
            currentExerciseIndex = index;
          });
        },
        itemBuilder: (context, index) {
          if (index == widget.excercise.length) {
            // Progress page
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Workout Progress',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentExerciseIndex = 0; // Reset to the first exercise
                        progress = 0.0; // Reset progress
                      });
                    },
                    child: Text('Restart Workout'),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(widget.excercise[index]['images']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.excercise[index]['name'],
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.excercise[index]['sets'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Call updateProgress function when Done button is pressed
                        updateProgress();
                        // Move to the next exercise
                        setState(() {
                          currentExerciseIndex++;
                        });
                      },
                      child: Text('Done'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
