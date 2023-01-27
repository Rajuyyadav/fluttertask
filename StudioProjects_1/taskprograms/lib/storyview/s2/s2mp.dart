import 'package:flutter/material.dart';
import 'package:taskprograms/storyview/s2/storypage1.dart';

import '../storypage.dart';


class S2MP extends StatefulWidget {
  const S2MP({Key? key}) : super(key: key);

  @override
  State<S2MP> createState() => _S2MPState();
}

class _S2MPState extends State<S2MP> {
  // final users = [
  //   User(
  //     name: "akash",
  //     imgUrl: "",
  //     stories: [],
  //   ),
  //   User(
  //     name: "pavan",
  //     imgUrl: "",
  //     stories: [],
  //   ),
  //   User(
  //     name: "vamshi",
  //     imgUrl: "",
  //     stories: [],
  //   ),
  // ];
  final guest = [
    "arun".toUpperCase(),
    "varun".toUpperCase(),
    "tarun".toUpperCase()
  ];

  bool r = false;
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: guest.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const StoryPage1()));
                    },
                    leading: const CircleAvatar(),
                    title: Text(
                      guest[index],
                      style: TextStyle(color: Colors.purple),
                    ),
                  );
                }),
            //===========================================================
            const Divider(
              thickness: 2,
            ),
            ListView(shrinkWrap: true, children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const StoryPage()));
                },
                child: const ListTile(
                  title: Text("aaa"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/citiesImages/img.png"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const StoryPage()));
                },
                child: const ListTile(
                  title: Text("bbb"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/citiesImages/img.png"),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

/*
*  a button changes color on click
*
*  TextButton(
              onPressed: () {
                setState(() {});

                r = !r;
              },
              child: Text("r")),
          TextButton(
              onPressed: () {
                setState(() {});

                b = !b;
              },
              child: Text("b")),
          Container(
            height: 50,
            color: r
                ? Colors.red
                : b
                    ? Colors.blue
                    : Colors.green,
          )
* */
