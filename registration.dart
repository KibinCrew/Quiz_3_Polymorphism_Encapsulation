import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'student.dart';
import 'employee.dart';
import 'dart:math';

// store users and unique info
List<Person> users = [];
List<String> emails = [];
List<int> stuNums = [];
List<int> empNums = [];

// generate random 10-char password
String generatePassword() {
  const String chars =
      "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
  Random rand = Random();
  return List.generate(10, (index) => chars[rand.nextInt(chars.length)]).join();
}

// generate username
String generateUsername(String name) {
  name = name.replaceAll(" ", "");
  String nameFive = name.length >= 5
      ? name.substring(0, 5).toLowerCase()
      : name.toLowerCase();
  Random rand = Random();
  int randomDigits = rand.nextInt(90) + 10;
  return nameFive + randomDigits.toString();
}

// register a new student
void registerStudent() {
  printBorder();
  print("=========== Register Student ===========");
  printBorder();

  // ask student number
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

  // ask full name
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

  name = toProperCase(name);

  // ask email - student email only
  String? email;

  while (true) {
    stdout.write('Enter HAU student email address: ');
    email = stdin.readLineSync() ?? '';

    RegExp emailRE = RegExp(
      r"^[a-zA-Z0-9._%+-]+@student\.hau\.edu\.ph$",
    );

    if (!emailRE.hasMatch(email)) {
      print('Invalid student email. Use format: yourname@student.hau.edu.ph');
      continue;
    } else if (emails.contains(email)) {
      print('Email is already taken. Please use a different email.');
      continue;
    } else {
      emails.add(email);
      break;
    }
  }

  // generate password and username
  String password = generatePassword();
  String username = generateUsername(name);

  // create student
  var student = Student(name, email, password, username, studNum);
  users.add(student);

  // display registration info
  printBorder();
  print("Welcome $name");
  print("Your email is: $email");
  print("Your Student No: $studNum");
  print("Your username: $username");
  print("Your password: $password");
  printBorder();
}

// register employee
void registerEmployee() {
  printBorder();
  print("\n=========== Register Employee ==========");
  printBorder();

  // ask employee number
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

  // ask full name
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

  name = toProperCase(name);

  // ask email - employee email only
  String? email;

  while (true) {
    stdout.write('Enter HAU employee email address: ');
    email = stdin.readLineSync() ?? '';

    RegExp emailRE = RegExp(
      r"^[a-zA-Z0-9._%+-]+@employee\.hau\.edu\.ph$",
    );

    if (!emailRE.hasMatch(email)) {
      print('Invalid employee email. Use format: yourname@employee.hau.edu.ph');
      continue;
    } else if (emails.contains(email)) {
      print('Email is already taken. Please use a different email.');
      continue;
    } else {
      emails.add(email);
      break;
    }
  }

  // generate password and username
  String password = generatePassword();
  String username = generateUsername(name);

  // create employee
  var employee = Employee(name, email, password, username, empNum);
  users.add(employee);

  // display registration info
  printBorder();
  print("Welcome $name");
  print("Your email is: $email");
  print("Your Employee No: $empNum");
  print("Your username: $username");
  print("Your password: $password");
  printBorder();
}
