import 'package:flutter/material.dart';
import 'package:students_dash/register.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DashBoard"),
        ),
        body:
            // SafeArea(
            Column(children: [...students.map((e) => Text(e.fname)).toList()]));
    // );
  }
}
