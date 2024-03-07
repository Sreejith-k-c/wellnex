import 'package:flutter/material.dart';
import 'package:wellnex/database/male_diet_adv.dart';
import 'package:wellnex/view/homepage/diet_days.dart/a_diet.dart';

class AdvDiet extends StatefulWidget {
  const AdvDiet({super.key});

  @override
  State<AdvDiet> createState() => _AdvDietState();
}

class _AdvDietState extends State<AdvDiet> {
  var begdays = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7"
  ];
  var workouts = [
     "day 1 diet plan",
    "day 2 diet plan",
    "day 3 diet plan",
    "day 4 diet plan",
    "day 5 diet plan",
    "day 6 diet plan",
    "day 7 diet plan"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/edgar-castrejon-1SPu0KT-Ejg-unsplash.jpg"),
            fit: BoxFit.cover)
        ),
        child: ListView(
          children:List.generate(7, (index) => Card(
            color: Colors.white.withOpacity(0.5),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:
                 (context)=>dietAdva(meals: AdvancedDiet.dietPlanAdva[index]['meals']))),
                child: Container(
                  height: 110,
                  child: ListTile(
                    title: Text(begdays[index],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(workouts[index],
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