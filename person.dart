// base class for all users
class Person {
  String _name;
  String _email;
  String _password;
  String _username;
  int _failedAttempts;
  bool _isLocked; 

  // initialize user
  Person(this._name, this._email, this._password, this._username)
  : _failedAttempts = 0,
  _isLocked = false; 

  // getters and setters
  String get name => _name;
  set name(String value) => _name = value;

  String get email => _email;
  set email(String value) => _email = value;

  String get password => _password;
  set password(String value) => _password = value;

  String get username => _username;
  set username(String value) => _username = value;

  int get failed => _failedAttempts;
  set failed(int value) => _failedAttempts = value;

  bool get isLocked => _isLocked; 
  set isLocked(bool value) => _isLocked = value; 

  // display basic user info
  void display(){
    print("Name: $_name, Email: $_email");
  }

  // add failed attempt and lock if needed
  void countFailedAttempts(){
    _failedAttempts++;
    if (_failedAttempts >= 3) {
      _isLocked = true; 
      print("Account locked. Please contact admin."); 
    }
  }

  // reset failed attempts
  void resetFailedAttempts(){
    _failedAttempts = 0;
    _isLocked = false;  
  }
}

// Formal introduction for the "Welcome ________"
String toProperCase(String name) {
  return name
      .trim()
      .split(' ')
      .map((word) => word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '')
      .join(' ');
}