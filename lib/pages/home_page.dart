import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const HomePage({Key? key, required this.name, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name"),
            Text("Phone Number: $phoneNumber"),
          ],
        ),
      ),
    );
  }
}
