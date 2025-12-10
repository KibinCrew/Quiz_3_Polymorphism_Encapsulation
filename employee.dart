import 'person.dart';

class Employee extends Person {
  int _empNum;
  Employee(String name, String email, String password, this._empNum)
  : super( name, email, password);

  int get empNum => _empNum;

  @override
  void  display(){
    print("Employee: $name");
    print("Email: $email");
    print("Employee No: $_empNum");
  }
}