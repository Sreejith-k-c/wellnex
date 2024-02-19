import 'package:flutter/material.dart';

class WorkOutBeg extends StatefulWidget {
  const WorkOutBeg({super.key, required this.excercise});
  final List excercise;
  @override
  State<WorkOutBeg> createState() => _WorkOutBegState();
}

class _WorkOutBegState extends State<WorkOutBeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20),
        itemCount: widget.excercise.length,
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
                Expanded(child: Image.asset(widget.excercise[index]['images'])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.excercise[index]['name'],
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                Text(widget.excercise[index]['sets'],
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
          ),
    );
  }
}