import 'package:flutter/material.dart';

class TicTacToeLogic extends StatefulWidget {
  const TicTacToeLogic({Key? key}) : super(key: key);

  @override
  State<TicTacToeLogic> createState() => _TicTacToeLogicState();
}

class _TicTacToeLogicState extends State<TicTacToeLogic> {
  List grid = ['-', '-', '-', '-', '-', '-', '-', '-', '-'];
  String draw = '';
  bool istrue = false;

  void resetxo() {
    setState((){

      istrue = false;

      draw = "";

      winner = "";

      grid = ['-', '-', '-', '-', '-', '-', '-', '-', '-'];

    });

  }

  String currentuser = "X";
  String winner = '';

  void showxo(i) {
    if(!istrue){
      if (grid[i] == '-') {
        setState(() {
          grid[i] = currentuser;
          currentuser = currentuser == 'X' ? 'O' : 'X';
        });
        winningLogic(grid[i]);
      }
    }
  }

  bool currentmove(i1, i2, i3, sign) {
    if (grid[i1] == sign && grid[i2] == sign && grid[i3] == sign) {
      return true;
    }
    return false;
  }

  void winningLogic(currentSign) {
    if (currentmove(0, 1, 2, currentSign) ||
        currentmove(3, 4, 5, currentSign) ||
        currentmove(6, 7, 8, currentSign) ||
        currentmove(0, 3, 6, currentSign) ||
        currentmove(1, 4, 7, currentSign) ||
        currentmove(2, 5, 8, currentSign) ||
        currentmove(0, 4, 8, currentSign) ||
        currentmove(2, 4, 6, currentSign)) {
      winner = currentSign;
      istrue = true;
      print("$winner  wins");
    }else{
      var isMatchDraw = true;
      for (var element in grid) {
        if(element == '-'){
          isMatchDraw = false;
          break;
        }
      }
      setState(() {
        if(isMatchDraw){
          draw = 'draw';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (winner != "")
            Text(
              "$winner won the game",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          if (draw != "") const Text("This is a draw match"),
          Container(
            margin: const EdgeInsets.all(20),
            color: Colors.brown,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: grid.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      showxo(index);
                      if (istrue == true) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: Text("$winner won the match"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          resetxo();
                                        });
                                      },
                                      child: Text("reset")),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text("back")),
                                ],
                              );
                            });
                      }
                      //   showModalBottomSheet(context: context, builder: (ctx){
                      //   return Container(
                      //     color: Colors.red,
                      //     child:
                      //   );
                      // }
                      // );
                      // }
                    },
                    child: Container(
                      color: Colors.red[100],
                      child: Center(
                          child: Text(
                        grid[index],
                        style: const TextStyle(fontSize: 50),
                      )),
                    ),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  resetxo();
                });
              },
              child: Text("reset")),
        ],
      ),
    );
  }
}
