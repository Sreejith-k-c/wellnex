import 'package:flutter/material.dart';

class WorkOutInter extends StatefulWidget {
  const WorkOutInter({super.key, required this.excercise});
  final List excercise;
  @override
  State<WorkOutInter> createState() => _WorkOutInterState();
}

class _WorkOutInterState extends State<WorkOutInter> {
  int currentExerciseIndex = 0;

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

            // Progress
            
            return Center(
              child: Text(
                'Workout Progress',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
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