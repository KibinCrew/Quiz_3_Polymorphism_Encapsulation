import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'registration.dart';

void login() {
  printBorder();
  print("\n================= Login ================");
  printBorder();

  print("Enter email:");
  String email = stdin.readLineSync()!;
  print("Enter password:");
  String password = stdin.readLineSync()!;

  Person? loggedUser;
  for (var user in users) {
    if (user.email == email && user.password == password) {
      loggedUser = user;
      break;
    }
  }

  if (loggedUser == null) {
    printBorder();
    print("Invalid email or password.");
    printBorder();
    return;
  }

  if (loggedUser.isLocked) {
    printBorder();
    print(
      "Account have reached maximum failed attempts. Please contact admin.",
    );
    printBorder();
    return;
  }
  loggedUser.resetFailedAttempts();
  printBorder();
  print("Logged in successfully!");
  print("Would you like to change your password? (yes/no)");
  String? changePasswordChoice = stdin.readLineSync();

  if (changePasswordChoice?.toLowerCase() == 'yes') {
    changePassword(loggedUser);
  } else {
    print("You chose not to change your password.");
  }

  printBorder();
}

void changePassword(Person user) {
  print("Enter old password:");
  String oldPassword = stdin.readLineSync()!;
  if (oldPassword != user.password) {
    print(" Old password is incorrect.");
    return;
  }

  print("Enter new password of at least 8 characters:");
  String newPassword = stdin.readLineSync()!;

  if (newPassword.length < 8 || newPassword == oldPassword) {
    print(
      "New password must be at least 8 characters and different from past password.",
    );
    return;
  }
  print("Confirm new password:");
  String confirmNewPassword = stdin.readLineSync()!;

  if (newPassword != confirmNewPassword) {
    print("Passwords does not match.");
    return;
  }
  user.password = newPassword;
  print("Password has been changed successfully.");
}
