import 'package:flutter/material.dart';

class GameSelection extends StatefulWidget {
  const GameSelection({Key? key}) : super(key: key);

  @override
  State<GameSelection> createState() => _GameSelectionState();
}

int _index = 0;
List<String> gameList = ['Wordle', 'Hangman', 'CrossWord'];
List<String> gamePath = [
  'assets/wordle.jpg',
  'assets/hangman.png',
  'assets/wordhunt.png'
];
List<String> gameRoute=[
  '/wordle',
  '/hangman',
  '/wordhunt',

];




void selectedGame(BuildContext context){

  Navigator.pushNamed(context, gameRoute[_index]);

}

class _GameSelectionState extends State<GameSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 10,
            child: Container(
              child: Image.asset('assets/images.jpg'),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                  child: Text(gameList[_index],
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(2, 1),
                                blurRadius: 20)
                          ])))),
          Divider(
            thickness: 5,
          ),
          Container(
            color: Colors.grey.shade100,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 3,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        child: Image.asset(
                          gamePath[i],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent.shade100,
                padding: EdgeInsets.symmetric(horizontal: 16),

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
            selectedGame(context);

              },
              child: Text('Play',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
