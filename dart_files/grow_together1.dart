import 'package:flutter/material.dart';
import 'grow_together2.dart';
import 'grow_together3.dart';
class GrowTo1 extends StatelessWidget {
  const GrowTo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grow Together'),
        // backgroundColor: Colors.blue,
      ),
      body:

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Internship Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrowTo2()),
                );
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.work,
                    size: 60,
                    color: Colors.blue,
                  ),
                  Text(
                    'Internship',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Add space between the buttons
            // Placement Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrowTo2()),
                );
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.school,
                    size: 60,
                    color: Colors.green,
                  ),
                  Text(
                    'Placement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

