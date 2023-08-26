import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/login_controller.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/login_button.dart';
import 'package:flutter_instagram/src/widget/login_text_field.dart';
import 'package:flutter_instagram/src/widget/sign_up_button.dart';
import 'package:get/get.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(150),
                colors: [
              Color(0xfff5dfd5),
              Color(0xffd5e1f5),
              Color(0xffd5f5e2)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _top(),
            _body(),
            _bottom(),
          ],
        ),
      )),
    );
  }

  Widget _top() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            ImagePath.instagram,
            width: 70,
            height: 70,
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LoginTextField(
              controller: controller.email,
              label: '사용자 이름, 이메일 주소 또는 휴대폰 번호',
            ),
            const SizedBox(
              height: 10,
            ),
            LoginTextField(
              controller: controller.password,
              label: '비밀번호',
            ),
            const SizedBox(
              height: 10,
            ),
            LoginButton(
              onTap: () {
                controller.login();
              },
              child: const Text(
                '로그인',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('비밀번호를 잊으셨나요?')
          ],
        ),
      ),
    );
  }

  Widget _bottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SignUpButton(
              onTap: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: 'test@test.com', password: '123123123');
              },
              label: '새 계정 만들기',
            ),
          ),
          SizedBox(
            width: 90,
            height: 50,
            child: Image.asset(
              ImagePath.meta,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
