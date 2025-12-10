import 'person.dart';

class Student extends Person {
  int _studNum;
  Student(String name, String email, String password, this._studNum)
  : super( name, email, password);

  int get studNum => _studNum;

  @override
  void  display(){
    print("Student: $name");
    print("Email: $email");
    print("Student No: $_studNum");
  }
}