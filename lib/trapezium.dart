import 'package:flutter/material.dart';

class Trapezium extends StatefulWidget {
  const Trapezium({Key? key}) : super(key: key);

  @override
  State<Trapezium> createState() => _TrapeziumState();
}

class _TrapeziumState extends State<Trapezium> {
  TextEditingController sideA = TextEditingController();
  TextEditingController sideB = TextEditingController();
  TextEditingController sideC = TextEditingController();
  TextEditingController sideD = TextEditingController();
  TextEditingController height = TextEditingController();
  double? result = 0, numSideA = 0, numSideB = 0, numSideC = 0, numSideD = 0, numHeight = 0;

  perimeter() {
    setState(() {
      numSideA = double.parse(sideA.text);
      numSideB = double.parse(sideB.text);
      numSideC = double.parse(sideC.text);
      numSideD = double.parse(sideD.text);

      result = numSideA! + numSideB! + numSideC! + numSideD!;
    });
  }

  area() {
    setState(() {
      numSideA = double.parse(sideA.text);
      numSideB = double.parse(sideB.text);
      numHeight = double.parse(height.text);

      result = ((numSideA! + numSideB!) * numHeight!) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Trapezium Calculation")
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: sideA,
              decoration: InputDecoration(
                  labelText: "Input Side A",
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
              controller: sideB,
              decoration: InputDecoration(
                  labelText: "Input Side B",
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
              controller: sideC,
              decoration: InputDecoration(
                  labelText: "Input Side C",
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
              controller: sideD,
              decoration: InputDecoration(
                  labelText: "Input Side D",
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
                  perimeter();
                  sideA.clear();
                  sideB.clear();
                  sideC.clear();
                  sideD.clear();
                  height.clear();
                },
                child: const Text('Calculate Perimeter'),
              ),
              ElevatedButton(
                onPressed: (){
                  area();
                  sideA.clear();
                  sideB.clear();
                  sideC.clear();
                  sideD.clear();
                  height.clear();
                },
                child: const Text('Calculate Area'),
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