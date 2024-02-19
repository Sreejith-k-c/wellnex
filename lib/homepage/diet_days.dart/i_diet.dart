import 'package:flutter/material.dart';

class dietInt extends StatefulWidget {
  const dietInt({super.key, required this.meals});
  final List meals;
  @override
  State<dietInt> createState() => _dietIntState();
}

class _dietIntState extends State<dietInt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20),
        itemCount: widget.meals.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.meals[index],
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
          ),
    );
  }
}