import 'person.dart';

// employee class
class Employee extends Person {
  // store employee number
  int _empNum;

  //​‍​‌‍​‍‌​‍​‌‍​‍‌ constructor
  Employee(String name, String email, String password, String username, this._empNum)
    : super(name, email, password, username);

// get employee number
  int get empNum => _empNum;

// setters
set empNum(int value) => _empNum = value;

// Method
  int getNum() {
    return _empNum;
  }

// display employee details
  @override
  void display() {
    print("Employee: $name");
    print("Email: $email");
    print("Employee No: $_empNum");
    print(" " * 40);
  }
}
