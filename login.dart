import 'dart:io';
import 'main.dart';
import 'person.dart';
import 'registration.dart';

void login() {
  printBorder();
  print("\n================= Login ================");
  printBorder();

  // Get username ONCE
  String username = "";
  while (true) {
    stdout.write('Enter username: ');
    String? u = stdin.readLineSync();

    if (u == null || u.trim().isEmpty) {
      print("Username cannot be empty.");
      continue;
    }

    username = u.trim();
    break;
  }

  // Find user by username
  Person? foundUser;
  for (var user in users) {
    if (user.username == username) {
      foundUser = user;
      break;
    }
  }

  // User not found
  if (foundUser == null) {
    printBorder();
    print("Invalid username or password.");
    printBorder();
    return;
  }

  // Check if already locked
  if (foundUser.isLocked) {
    printBorder();
    print("Account locked. Please contact admin.");
    printBorder();
    return;
  }

  // PASSWORD LOOP - Allow up to 3 attempts
  while (!foundUser.isLocked) {
    stdout.write("Enter password: ");
    String? passwordInput = stdin.readLineSync();
    String password = passwordInput ?? '';

    // Check password
    if (foundUser.password != password) {
      foundUser.countFailedAttempts();
      printBorder();
      if (foundUser.isLocked) {
        print("Account locked. Please contact admin.");
      } else {
        int remaining = 3 - foundUser.failed;
        print("Invalid password. $remaining attempt(s) remaining.");
      }
      printBorder();
      
      // If locked, exit the loop
      if (foundUser.isLocked) {
        return;
      }
      // Otherwise, continue to next iteration (ask password again)
      continue;
    }

    // SUCCESS - Password is correct
    foundUser.resetFailedAttempts();
    printBorder();
    print("Logged in successfully!");
    print("Welcome, ${foundUser.name}!");

    // OPTIONAL: Change Password
    stdout.write("Would you like to change your password? (yes/no): ");
    String? changePasswordChoice = stdin.readLineSync();

    if (changePasswordChoice?.toLowerCase() == 'yes') {
      changePassword(foundUser);
    } else {
      print("You chose not to change your password.");
    }

    printBorder();
    return; // Exit after successful login
  }
}

// change password
void changePassword(Person user) {

  // Loop until correct old password is entered
  while (true) {
    stdout.write("Enter old password: ");
    String? oldPasswordInput = stdin.readLineSync();
    String oldPassword = oldPasswordInput ?? '';

    if (oldPassword != user.password) {
      print("Old password is incorrect. Try again.");
      continue;
    }

    break; // correct old password
  }

  // ask new password until valid
  String newPassword;
  while (true) {
    stdout.write("Enter new password (min 8 chars): ");
    String? newPasswordInput = stdin.readLineSync();
    newPassword = newPasswordInput ?? '';

    if (newPassword.length < 8) {
      print("Password too short. Try again.");
      continue;
    }

    if (newPassword == user.password) {
      print("New password must be different from old password.");
      continue;
    }

    break; // valid
  }

  // confirm password until match
  while (true) {  
    stdout.write("Confirm new password: ");
    String? confirmInput = stdin.readLineSync();
    String confirmNewPassword = confirmInput ?? '';

    if (confirmNewPassword != newPassword) {
      print("Passwords do not match. Try again.");
      continue;
    }

    break;
  }

  // update password
  user.password = newPassword;
  print("Password has been changed successfully.");
}