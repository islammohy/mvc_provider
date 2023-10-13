import 'package:flutter/material.dart';
import 'package:mvc_provider/user/user_model.dart';

class UserController extends ChangeNotifier {
  List<UserModel> users = [];
  //UserController({required this.users});

  void addUser(UserModel user) {
    users.add(user);
    notifyListeners();
  }

  void removeUser(int index) {
    users.removeAt(index);
    notifyListeners();
  }

  void increaseAge(int index) {
    users[index].age++;
    notifyListeners();
  }
}
