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

  // show each user
  for (var user in users) {
    user.display();
  }
  printBorder();
}
