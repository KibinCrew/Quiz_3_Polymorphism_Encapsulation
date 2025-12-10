import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'student.dart';
import 'employee.dart';
import 'dart:math';

List<Person> users = [];
List<String> emails = [];
List<int> stuNums = [];
List<int> empNums = [];

String generatePassword() {
  const String chars =
      "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
  Random rand = Random();
  return List.generate(10, (index) => chars[rand.nextInt(chars.length)]).join();
}

String generateUsername(String name) {
  String nameFive = name.length >= 5
      ? name.substring(0, 5).toLowerCase()
      : name.toLowerCase();
  Random rand = Random();
  int randomDigits = rand.nextInt(90) + 10;
  return nameFive + randomDigits.toString();
}

void registerStudent() {
  printBorder();
  print("=========== Register Student ===========");
  printBorder();

  int? studNum;
  String? studNumInput;

  while (true) {
    stdout.write("Enter student number: ");
    studNumInput = stdin.readLineSync();
    studNum = int.tryParse(studNumInput ?? '');

    if (studNum == null || studNum <= 0) {
      print("Invalid student number. Please try again.");
      continue;
    } else if (stuNums.contains(studNum)) {
      print("Student number is already taken. Please use a different number.");
      continue;
    } else {
      stuNums.add(studNum);
      break;
    }
  }

  String? name;

  while (true) {
    stdout.write('Enter full name: ');
    name = stdin.readLineSync();

    if (name == null || name.isEmpty || name.trim().isEmpty) {
      print('Name cannot be empty. Please try again.');
      continue;
    }

    RegExp nameRE = RegExp(r"^[a-zA-Z\s]+$");

    if (!nameRE.hasMatch(name)) {
      print('Invalid name. Please use letters and spaces only.');
      continue;
    } else {
      break;
    }
  }

  String? email;

  while (true) {
    stdout.write('Enter email address: ');
    email = stdin.readLineSync() ?? '';

    RegExp emailRE = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!email.contains('@') || email.isEmpty || email.trim().isEmpty) {
      print('Invalid email format. Please try again.');
      continue;
    } else if (emails.contains(email)) {
      print('Email is already taken. Please use a different email.');
      continue;
    } else if (!emailRE.hasMatch(email)) {
      print('Invalid email format. Please try again.');
      continue;
    } else {
      emails.add(email);
      break;
    }
  }
  String password = generatePassword();
  String username = generateUsername(name);

  var student = Student(name, email, password, studNum);
  users.add(student);

  printBorder();
  print("Welcome $name");
  print("Your email is: $email");
  print("Your Student No: $studNum");
  print("Your username: $username");
  print("Your password: $password");
  printBorder();
}

void registerEmployee() {
  printBorder();
  print("\n=========== Register Employee ==========");
  printBorder();

  int? empNum;
  String? empNumInput;

  while (true) {
    stdout.write("Enter employee number: ");
    empNumInput = stdin.readLineSync();
    empNum = int.tryParse(empNumInput ?? '');

    if (empNum == null || empNum <= 0) {
      print("Invalid employee number. Please try again.");
      continue;
    } else if (empNums.contains(empNum)) {
      print("Employee number is already taken. Please use a different number.");
      continue;
    } else {
      empNums.add(empNum);
      break;
    }
  }

  String? name;

  while (true) {
    stdout.write('Enter full name: ');
    name = stdin.readLineSync();

    if (name == null || name.isEmpty || name.trim().isEmpty) {
      print('Name cannot be empty. Please try again.');
      continue;
    }

    RegExp nameRE = RegExp(r"^[a-zA-Z\s]+$");

    if (!nameRE.hasMatch(name)) {
      print('Invalid name. Please use letters and spaces only.');
      continue;
    } else {
      break;
    }
  }

  String? email;

  while (true) {
    stdout.write('Enter email address: ');
    email = stdin.readLineSync() ?? '';

    RegExp emailRE = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!email.contains('@') || email.isEmpty || email.trim().isEmpty) {
      print('Invalid email format. Please try again.');
      continue;
    } else if (emails.contains(email)) {
      print('Email is already taken. Please use a different email.');
      continue;
    } else if (!emailRE.hasMatch(email)) {
      print('Invalid email format. Please try again.');
      continue;
    } else {
      emails.add(email);
      break;
    }
  }
  String password = generatePassword();
  String username = generateUsername(name);

  var employee = Employee(name, email, password, empNum);
  users.add(employee);

  printBorder();
  print("Welcome $name");
  print("Your email is: $email");
  print("Your Employee No: $empNum");
  print("Your username: $username");
  print("Your password: $password");
  printBorder();
}
