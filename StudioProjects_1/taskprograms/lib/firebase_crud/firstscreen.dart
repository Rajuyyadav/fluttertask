import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstScreenFBC extends StatefulWidget {
  const FirstScreenFBC({Key? key}) : super(key: key);

  @override
  State<FirstScreenFBC> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreenFBC> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
              fillColor: Colors.red, labelText: "enter anything"),
          controller: controller,
          cursorColor: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final name = controller.text;
                createUser(name: name);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Firebase CRUD operation'), Text("hello data")],
      ),
    );
  }

  Future createUser({required String name}) async {
    ///reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    final json = {
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };

    /// create document and write data to Firebase
    await docUser.set(json);
  }
}
