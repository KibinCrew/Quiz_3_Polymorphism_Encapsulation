import 'dart:io';
import 'login.dart';
import 'registration.dart';
import 'usersList.dart';

void main() {
  while (true) {
    printBorder();
    print("\n========= Users Account System =========");
    print(" | (1) Register Student          |");
    print(" | (2) Register Employeee        |");
    print(" | (3) Login as a user           |");
    print(" | (4) View All Users            |");
    print(" | (0) Exit the Portal           |");
    printBorder();
    stdout.write("Choose an option: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        registerStudent();
        break;
      case '2':
        registerEmployee();
        break;
      case '3':
        login();
        break;
      case '4':
        viewUsers(users);
        break;
      case '0':
        print("Exiting System..........");
        printBorder();
        return;
      default:
        print("Invalid choice. Please try again.");
        printBorder();
    }
  }
}

void printBorder() {
  print("=" * 40);
}
