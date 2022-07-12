import 'package:flutter/material.dart';
import 'package:word_game_multiple/wordhunt/widgets/board.dart';
import 'package:word_game_multiple/wordhunt/widgets/word_list.dart';



class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final gameWords = [
    "pikachu",
    "ratata",
    "charmander",
    "squrtle",
    "bulbasaur",
    "caterpie",
    "abra",
    "pidgey",
    "ekans",
    "mewtwo",
  ];
  List<int> hitWordIndexes = [];

  bool get isFinished {
    return hitWordIndexes.length == gameWords.length;
  }

  void onHomeAction(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed("/");
  }

  void onNewGameAction(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed("/play");
  }

  void onHitWord(String word, int wordIndex) {
    this.setState(() {
      hitWordIndexes = List.from(hitWordIndexes)..add(wordIndex);
    });

    if (isFinished) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text("Mew!"),
          content: Text("You catched em all!"),
          actions: [
            TextButton(
              child: Text("Home"),
              onPressed: () => onHomeAction(context),
            ),
            TextButton(
              child: Text("New Game"),
              onPressed: () => onNewGameAction(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boardWidth = size.width;
    final boardHeight = 0.5 * size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Play')),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 0.2 * size.height,
                child: WordList(gameWords, hitIndexes: hitWordIndexes),
              ),
              Flexible(
                child: Board(
                  width: boardWidth,
                  height: boardHeight,
                  words: gameWords,
                  onHitWord: onHitWord,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
