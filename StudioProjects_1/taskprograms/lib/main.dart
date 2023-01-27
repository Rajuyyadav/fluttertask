import 'package:flutter/material.dart';
import 'package:taskprograms/container_task_colors.dart';
import 'package:taskprograms/firebase_crud/firebasefirstscreen.dart';
import 'package:taskprograms/firebase_crud/firstscreen.dart';
import 'package:taskprograms/storyview/s2/s2mp.dart';
import 'package:taskprograms/tic_tac_toe/tic_tac_toe_l.dart';
import 'package:taskprograms/tic_tac_toe/tictactoep2.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebaseloginscreen/firstscreen_fb.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils1.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FireBaseFirstScreen(),
      // FirstScreenFBC(),
      // Firebaseloginscreen(),
      // S2MP(),

      // TicTacToeP2(),

      // TicTacToeLogic(),
      // TaskContainer(),
      //

      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
