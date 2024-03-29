import 'package:flutter/material.dart';
import 'package:wellnex/database/male_workout_beg.dart';
import 'package:wellnex/view/homepage/workout_days/workout_beg.dart';

class BegDays extends StatefulWidget {
  const BegDays({super.key});

  @override
  State<BegDays> createState() => _BegDaysState();
}

class _BegDaysState extends State<BegDays> {
  var begdays = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/logan-weaver-lgnwvr-LzT-WMv1xrI-unsplash.jpg"),
            fit: BoxFit.cover)
        ),
        child: ListView(
          children:List.generate(7, (index) => Card(
            color: Colors.white.withOpacity(0.4),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                 WorkOutBeg(excercise: BegWorkout.workoutPlanBeg[index]['exercises']),)),
                child: Container(
                  height: 110,
                  child: ListTile(
                    title: Text(BegWorkout.workoutPlanBeg[index]['day'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(BegWorkout.workoutPlanBeg[index]['workout'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                        Icon(Icons.navigate_next,
                        size: 40,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            )
          )),
      ),
    );
  }
}