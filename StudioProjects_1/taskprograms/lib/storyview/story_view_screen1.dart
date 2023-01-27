
import 'package:flutter/material.dart';
import 'package:taskprograms/storyview/storypage.dart';
import 'package:taskprograms/storyview/user.dart';

class StoryViewScreenOne extends StatefulWidget {
  const StoryViewScreenOne({Key? key}) : super(key: key);

  @override
  State<StoryViewScreenOne> createState() => _StoryViewScreenOneState();
}

class _StoryViewScreenOneState extends State<StoryViewScreenOne> {
  final users = [
    User(
      name: "akash",
      imgUrl: "",
      stories: [],
    ),
    User(
      name: "pavan",
      imgUrl: "",
      stories: [],
    ),
    User(
      name: "vamshi",
      imgUrl: "",
      stories: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: users.map((user) => InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx)=>StoryPage()));

            },
            child: ListTile(
              title: Text(user.name.toString()),
              leading: CircleAvatar(backgroundImage: AssetImage("asset/img.png"),),

            ),
          )).toList(),

        ),
      ),
    );
  }
}

