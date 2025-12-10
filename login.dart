import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'registration.dart';

// login function
void login() {
  printBorder();
  print("\n================= Login ================");
  printBorder();

  // ask email
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
    } else if (!emailRE.hasMatch(email)) {
      print('Invalid email format. Please try again.');
      continue;
    } else {
      emails.add(email);
      break;
    }
  }

  // ask password
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  // check user
  Person? loggedUser;
  for (var user in users) {
    if (user.email == email && user.password == password) {
      loggedUser = user;
      break;
    }
  }

  // invalid login
  if (loggedUser == null) {
    printBorder();
    print("Invalid email or password.");
    printBorder();
    return;
  }

  // check if account is locked
  if (loggedUser.isLocked) {
    printBorder();
    print(
      "Account have reached maximum failed attempts. Please contact admin.",
    );
    printBorder();
    return;
  }

  // reset failed attempts
  loggedUser.resetFailedAttempts();
  printBorder();
  print("Logged in successfully!");
  print("Welcome, ${loggedUser.name}!");

  // change password option
  stdout.write("Would you like to change your password? (yes/no): ");
  String? changePasswordChoice = stdin.readLineSync();

  if (changePasswordChoice?.toLowerCase() == 'yes') {
    changePassword(loggedUser);
  } else {
    print("You chose not to change your password.");
  }

  printBorder();
}

// change password 
void changePassword(Person user) {
  stdout.write("Enter old password:");
  String oldPassword = stdin.readLineSync()!;
  if (oldPassword != user.password) {
    print(" Old password is incorrect.");
    return;
  }

  // ask new password
  print("Enter new password of at least 8 characters:");
  String newPassword = stdin.readLineSync()!;

  if (newPassword.length < 8 || newPassword == oldPassword) {
    print(
      "New password must be at least 8 characters and different from past password.",
    );
    return;
  }

  // confirm new password
  print("Confirm new password:");
  String confirmNewPassword = stdin.readLineSync()!;

  if (newPassword != confirmNewPassword) {
    print("Passwords does not match.");
    return;
  }

  // update password
  user.password = newPassword;
  print("Password has been changed successfully.");
}
