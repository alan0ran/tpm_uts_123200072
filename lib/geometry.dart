import 'package:flutter/material.dart';

import 'trapezium.dart';
import 'cylinder.dart';

class Geometry extends StatelessWidget {
  const Geometry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Geometry'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Trapezium()
                      ),
                    );
                  },
                  child: const Text('Trapezium'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cylinder()
                      ),
                    );
                  },
                  child: const Text('Cylinder'),
                ),
              ),
            ],
          ),
        )
    );
  }
}