import 'package:flutter/material.dart';

class Cylinder extends StatefulWidget {
  const Cylinder({Key? key}) : super(key: key);

  @override
  State<Cylinder> createState() => _CylinderState();
}

class _CylinderState extends State<Cylinder> {
  TextEditingController radius = TextEditingController();
  TextEditingController height = TextEditingController();
  double? result = 0, numRadius = 0, numHeight = 0;

  area() {
    setState(() {
      numRadius = double.parse(radius.text);
      numHeight = double.parse(height.text);

      result = 2 * 3.14 * numRadius! * (numRadius! + numHeight!);
    });
  }

  volume() {
    setState(() {
      numRadius = double.parse(radius.text);
      numHeight = double.parse(height.text);

      result = 3.14 * numRadius! * numRadius! * numHeight!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cylinder Calculation")
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: radius,
              decoration: InputDecoration(
                  labelText: "Input Radius",
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: height,
              decoration: InputDecoration(
                  labelText: "Input Height",
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  area();
                  radius.clear();
                  height.clear();
                },
                child: const Text('Calculate Area'),
              ),
              ElevatedButton(
                onPressed: (){
                  volume();
                  radius.clear();
                  height.clear();
                },
                child: const Text('Calculate Volume'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 25),
            child: Text(
              "Result : $result",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
