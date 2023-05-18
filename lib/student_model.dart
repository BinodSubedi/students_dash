class Students {
  final String fname;
  final String lname;
  final String age;
  final String gender;
  final String batch;
  const Students(
      {required this.fname,
      required this.lname,
      required this.age,
      required this.gender,
      required this.batch});

  Students copywith({fname, lname, age, gender, batch}) {
    return Students(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        batch: batch ?? this.batch);
  }
}
