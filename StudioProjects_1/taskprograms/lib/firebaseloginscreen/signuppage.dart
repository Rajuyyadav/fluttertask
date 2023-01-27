import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'firstscreen_fb.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  final Function() onClickedSignIn;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const FlutterLogo(
              size: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hey There, Welcome Back",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "passsword",
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter min. 6 characters'
                  : null,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.red,
              ),
              onPressed: signUp,
              icon: const Icon(
                Icons.arrow_forward,
                size: 32,
              ),
              label: const Text(
                "Sign Up ",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "Already have an account?",
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
                      ..onTap = widget.onClickedSignIn,
                    text: "Log In",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.green[500],
                      fontSize: 16,
                    ),
                  )
                ])),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils1.showSnackBar(e.message);
    }
    //Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
