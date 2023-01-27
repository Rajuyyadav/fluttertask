import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'firstscreen_fb.dart';
import 'forgetpassword.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: emailcontroller,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: passwordcontroller,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "passsword",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.red,
            ),
            onPressed: signIn,
            icon: const Icon(
              Icons.lock_open,
              size: 32,
            ),
            label: const Text(
              "Sign in ",
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              "Forget Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ForgetPasswordPage(),
            )),
          ),
          RichText(
              text: TextSpan(
                  text: "No Account",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  children: [
                const WidgetSpan(
                  child: SizedBox(
                    width: 10,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: "Sign up",
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 16,
                  ),
                )
              ])),
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils1.showSnackBar(e.message);
    }
    //Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

//===============================
