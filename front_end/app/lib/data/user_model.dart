import 'package:app/data/user_model.dart';

class User {
  String? fullName;
  String? email;
  String? password;
  String? get getFullName => this.fullName;
  set setFullName(String fullName) => this.fullName = fullName;
  String? get getPassword => this.password;
  set setPassword(String password) => this.password = password;
  User({required this.fullName, required this.email, required this.password});
  static getConnectedUSer() {
    return User(fullName: "abir", email: "abir@gmail.com", password: "****");
  }
}
