import 'package:flutter/material.dart';

class FireBaseFirstScreen extends StatefulWidget {
  const FireBaseFirstScreen({Key? key}) : super(key: key);

  @override
  State<FireBaseFirstScreen> createState() => _FireBaseFirstScreenState();
}

class _FireBaseFirstScreenState extends State<FireBaseFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("data"),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
