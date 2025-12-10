import 'person.dart';

class Student extends Person {
  // student number
  int _studNum;
   Student(String name, String email, String password, String username, this._studNum)
    // initialize parent
    : super(name, email, password, username);

  // getters
  int get studNum => _studNum;

  // setters
  set studNum(int value) => _studNum = value;

  // Method
  int getNum() {
    return _studNum;
  }
  

  // display info
  @override
  void display() {
    print("Student: $name");
    print("Email: $email");
    print("Student No: $_studNum");
    print(" " * 40);
  }
}
