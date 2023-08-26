import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _email = TextEditingController();
  final _password = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void login() {
    print(_email.value.text);
    print(_password.value.text);
    AuthHandler.signIn(_email.value.text.trim(), _password.value.text.trim());
  }
}
