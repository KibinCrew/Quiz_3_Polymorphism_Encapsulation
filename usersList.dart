import 'main.dart';
import 'person.dart';

// display all users
void viewUsers(List<Person> users) {
  printBorder();

  // check if list is empty
  if (users.isEmpty) {
    print("No user is registered yet.");
    printBorder();
    return;
  }

  // polymorphism that treats Student and Employee objects as Person
  // calling overridden display() method
  for (var user in users) {
    user.display(); // calls Student or Employee display()
  }
  printBorder();
}