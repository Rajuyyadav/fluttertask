import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
   final StoryController controller = StoryController();

  // List<StoryItem> storyitem = [
  //   StoryItem.pageImage(url: "m", controller: controller),
  //   StoryItem.pageImage(url: "m", controller: controller),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        StoryItem.text(
          title: "welcome to my story",
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
        StoryItem.pageImage(
          url:
              "https://th.bing.com/th/id/OIP.lij9upc281pqvAxCS5NOBwHaLH?pid=ImgDet&rs=1",
          controller: controller,
          duration: const Duration(seconds: 5),
        ),
        StoryItem.pageImage(
            url: "https://media.tenor.com/lMvgWanWPVsAAAAC/nature.gif",
            controller: controller),
        StoryItem.pageImage(
            url:
                "https://i.pinimg.com/originals/83/4d/72/834d72ef32d84b400266a4aa6661ff31.gif",
            controller: controller),
        StoryItem.inlineImage(
            url: "https://media3.giphy.com/media/S67m7E7yH5Wta/200w.gif",
            caption: const Text(
              "good morning",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decorationColor: Colors.orange),
            ),
            duration: const Duration(seconds: 5),
            controller: controller),
      ],
      controller: controller,
    );
  }
}
