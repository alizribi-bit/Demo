import 'package:demo/Classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends ChangeNotifier {
  String _email = "";
  bool test = false;

  String get email => _email;

  set email(String eamil) {
    _email = eamil;
    notifyListeners();
  }

  /* void changeMail({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  } */
}
