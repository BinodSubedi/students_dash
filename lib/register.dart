import 'package:flutter/material.dart';
import 'package:students_dash/login.dart';
import 'package:students_dash/student_model.dart';

List<Students> students = [];

bool checkStudens(String fname, String batch) {
  for (int i = 0; i < students.length; i++) {
    if (students[i].fname == fname && students[i].batch == batch) {
      return true;
    }
  }
  return false;
}

enum Gender { male, female, other }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // bool value = false;
  static const List<String> list = <String>['29A', '29B', '30A', '30B'];
  String dropdownValue = '29A';

  Gender? value = Gender.male;

  getVal(Gender input) {
    if (input == Gender.male) {
      return 'Male';
    } else if (input == Gender.female) {
      return 'Female';
    } else {
      return 'Other';
    }
  }

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController age = TextEditingController();

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
              decoration: const InputDecoration(hintText: 'lname'),
              controller: lname,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'age'),
              controller: age,
            ),
            // Row(children: [
            // const Text('Male'),

            Column(children: [
              Row(children: [
                Text('Male'),
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: value,
                  onChanged: (Gender? val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ]),
              Row(children: [
                Text('Female'),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: value,
                  onChanged: (Gender? val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ]),
              Row(children: [
                Text('Other'),
                Radio<Gender>(
                  value: Gender.other,
                  groupValue: value,
                  onChanged: (Gender? val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ]),
            ]),

            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () {
                  Students newStudent = Students(
                      fname: fname.text,
                      lname: lname.text,
                      age: age.text,
                      gender: getVal(value!),
                      batch: dropdownValue);
                  students.add(newStudent);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Register'))
          ],
        ),
      )),
    );
  }
}
