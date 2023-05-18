import 'package:flutter/material.dart';
import 'package:students_dash/dashboard.dart';
import 'package:students_dash/register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController fname = TextEditingController();
  TextEditingController batch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'fname'),
              controller: fname,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Batch'),
              controller: batch,
            ),
            ElevatedButton(
                onPressed: () {
                  if (checkStudens(fname.text, batch.text)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()),
                    );
                  }
                },
                child: const Text('Login')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('Register')),
          ],
        ),
      )),
    );
  }
}
