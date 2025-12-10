class Person {
  String _name;
  String _email;
  String _password;
  int _failedAttempts;
  bool _islocked;
  Person(this._name, this._email, this._password)
  : _failedAttempts = 0,
  _islocked = false;

  String get name => _name;
  set name(String value) => _name = value;
  String get email => _email;
  set email(String value) => _email = value;
  String get password => _password;
  set password(String value) => _password = value;
  int get failed => _failedAttempts;
  set failed(int value) => _failedAttempts = value;
  bool get isLocked => _islocked;
  set isLocked(bool value) => _islocked = value;

  void display(){
    print("Name: $_name, Email: $_email");
  }
  void countFailedAttempts(){
    _failedAttempts++;
    if (_failedAttempts >= 3) {
      _islocked = true;
      print("You have reached the maximum failed attempts. Please contact admin to fix");
    }
  }
  void resetFailedAttempts(){
    _failedAttempts = 0;
    _islocked =false;
  }
}