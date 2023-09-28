abstract class Authstates {}

class Authintialstate extends Authstates {}

class registerloadingstate extends Authstates {}

class registersucesslstate extends Authstates {}

class failedtoregisterstate extends Authstates {
  String message;
  failedtoregisterstate({required this.message});
}

class loginloadingstate extends Authstates {}

class loginsucesslstate extends Authstates {}

class failedlogingstate extends Authstates {
  String messsage;
  failedlogingstate({required this.messsage});
}
