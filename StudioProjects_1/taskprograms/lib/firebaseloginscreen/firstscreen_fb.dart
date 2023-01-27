import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskprograms/firebaseloginscreen/signuppage.dart';
import 'package:taskprograms/main.dart';

import 'email_verification.dart';
import 'homepage.dart';
import 'loginwidget.dart';

class Firebaseloginscreen extends StatefulWidget {
  const Firebaseloginscreen({Key? key}) : super(key: key);

  @override
  State<Firebaseloginscreen> createState() => _FirebaseloginscreenState();
}

class _FirebaseloginscreenState extends State<Firebaseloginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f2d2d),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('something went wrong'));
          } else if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}

//=======================================================

//=============================================================
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignUp: toggle)
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}

//=======================================================

class Utils1 {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
//=================================================
