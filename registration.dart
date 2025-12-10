import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'student.dart';
import 'employee.dart';
import 'dart:math';

List<Person> users = [];

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
  print("Enter student number:");
  int studNum = int.parse(stdin.readLineSync()!);
  print("Enter full name:");
  String name = stdin.readLineSync()!;
  print("Enter email:");
  String email = stdin.readLineSync()!;
  String password = generatePassword();
  String username = generateUsername(name);

  var student = Student(name, email, password, studNum);
  users.add(student);

  printBorder();
  print("Welcome $name.");
  print("Your email is: $email.");
  print("Your Student No: $studNum.");
  print("Your username: $username.");
  print("Your password: $password.");
  printBorder();
}

void registerEmployee() {
  printBorder();
  print("\n=========== Register Employee ==========");
  printBorder();
  print("Enter employee number:");
  int empNum = int.parse(stdin.readLineSync()!);
  print("Enter full name:");
  String name = stdin.readLineSync()!;
  print("Enter email:");
  String email = stdin.readLineSync()!;
  String password = generatePassword();
  String username = generateUsername(name);

  var employee = Employee(name, email, password, empNum);
  users.add(employee);

  printBorder();
  print("Welcome $name.");
  print("Your email is: $email.");
  print("Your Employee No: $empNum.");
  print("Your username: $username.");
  print("Your password: $password.");
  printBorder();
}
