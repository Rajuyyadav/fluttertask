import 'package:flutter/material.dart';
class Player{
  static const none="";
  static const x="X";
  static const o="O";
}

class TicTacToeP2 extends StatefulWidget {
  const TicTacToeP2({Key? key}) : super(key: key);

  @override
  State<TicTacToeP2> createState() => _TicTacToep2State();
}

class _TicTacToep2State extends State<TicTacToeP2> {

  Player play = Player();

  static final countMatrix = 3;
  static final double size = 92;


  List<List<String>>? matrix;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setEmptyField();
  }

  setEmptyField() =>
      setState(() {
        matrix = List.generate(
            countMatrix, (_) => List.generate(countMatrix, (_) => Player.o));
      });

  Widget buildRow(int x){
final values = matrix![x];
return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:Utils.modelBuilder(values, (y, model) => buildField(x,y))
);
  }


  Widget buildField(int x, int y) {
    final value = matrix![x][y];
    return Container(
      margin: const EdgeInsets.all(4),

      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size, size),
      ),
          child: Text(value,style: const TextStyle(fontSize: 32)),
        onPressed: (){},

      ),
    );


  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Tic Tac Toe"), centerTitle: true,


      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Utils.modelBuilder(matrix!, (x, value) => buildRow(x))
      ),
    );



  }


}





class Utils {
  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function (int index, M model) builder) => models
      .asMap()
  .map<int, Widget>(
  (index, model)=>MapEntry(index, builder(index, model)))
  .values
  .toList();


}
