import 'package:flutter/material.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({Key? key}) : super(key: key);

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  final _controller = ScrollController();
  final List<Color> colorbox = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.white,
    Colors.black
  ];
  Color colIndex = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){scrollUp();}, child: Text("^",style: TextStyle(color: Colors.red),))

        ],
        title: Text("click to change color"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              color: Colors.grey[300],
              width: 100,
              child: ListView.builder(
                  itemCount: colorbox.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(


                      onTap: () {
                        scrollUp();
                        setState(() {
                          colIndex = colorbox[index];

                          print("${colIndex} ==============");
                        });
                      },
                      child: Container(
                        color: colorbox[index],
                        height: 100,
                        child: const Center(
                            child: Text(
                              "data",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ))),
          Expanded(
            child: Container(
              width: 100,
              child: GridView.builder(
                controller: _controller,

                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 100,

                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.all(10),

                  color: colIndex,
                  // height: 100,
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${index + 1} data",
                          style:  TextStyle(color: colIndex==Colors.white ?Colors.black:Colors.white),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void scrollUp() {
    final double start = 0;

    _controller.jumpTo(start);


  }
}
