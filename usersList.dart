import 'main.dart';
import 'person.dart';

void viewUsers(List<Person> users){
  printBorder();
  if (users.isEmpty){
    print("No user is registered yet.");
    printBorder();
    return;
  }
  for (var user in users) {
    user.display();
  }
  printBorder();
}
