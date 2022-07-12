import 'package:flutter/material.dart';
import 'package:word_game_multiple/hangman/engine/hangman.dart';




const List<String> progressImages = const [
  'assets/datas/img/progress_0.png',
  'assets/datas/img/progress_1.png',
  'assets/datas/img/progress_2.png',
  'assets/datas/img/progress_3.png',
  'assets/datas/img/progress_4.png',
  'assets/datas/img/progress_5.png',
  'assets/datas/img/progress_6.png',
  'assets/datas/img/progress_7.png',
];

const String victoryImage = 'assets/datas/img/victory.png';
const List<String> wordList = const ["OWNER","CUSTOMER","HANDPHONE","ISTANBUL","PROGRAMMING","MOBILE","FLUTTER","HANGMAN","UNIVERSITY","KULTUR","PLENTY","ACHIEVE","CLASS","STARE","AFFECT","THICK","CARRIER","BILL","SAY","ARGUE","OFTEN","GROW","VOTING","SHUT","PUSH","FANTASY","PLAN","LAST","ATTACK","COIN","ONE","STEM","SCAN","ENHANCE","PILL","OPPOSED","FLAG","RACE","SPEED","BIAS","HERSELF","DOUGH","RELEASE","SUBJECT","BRICK","SURVIVE","LEADING","STAKE","NERVE","INTENSE","SUSPECT","WHEN","LIE","PLUNGE","HOLD","TONGUE","ROLLING","STAY","RESPECT","SAFELY"];

const List<String> alphabet = const [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
];

const TextStyle activeWordStyle = TextStyle(
  fontSize: 30.0,
  letterSpacing: 5.0,
);

class HangmanPage extends StatefulWidget {
  late HangmanGame _engine;



  @override
  State<StatefulWidget> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  bool _showNewGame =false;
  String _activeImage ='';
  String _activeWord = '';

  @override
  void initState() {
    super.initState();

    widget._engine = HangmanGame(wordList);
    widget._engine.onChange.listen(this._updateWordDisplay);
    widget._engine.onWrong.listen(this._updateGallowsImage);
    widget._engine.onWin.listen(this._win);
    widget._engine.onLose.listen(this._gameOver);

    this._newGame();
  }

  void _updateWordDisplay(String word) {
    this.setState(() {
      _activeWord = word;
    });
  }

  void _updateGallowsImage(int wrongGuessCount) {
    this.setState(() {
      _activeImage = progressImages[wrongGuessCount];
    });
  }

  void _win([_]) {
    this.setState(() {
      _activeImage = victoryImage;
      this._gameOver();
    });
  }

  void _gameOver([_]) {
    this.setState(() {
      _showNewGame = true;
    });
  }

  void _newGame() {
    widget._engine.newGame();

    this.setState(() {
      _activeWord = '';
      _activeImage = progressImages[0];
      _showNewGame = false;
    });
  }

  Widget _renderBottomContent() {
    if (_showNewGame) {
      return ElevatedButton(
        child: Text('New Game'),
        onPressed: this._newGame,
      );
    } else {
      final Set<String> lettersGuessed = widget._engine.lettersGuessed;

      return Container(

        child: Wrap(

          spacing: 1.0,
          runSpacing: 1.0,
          alignment: WrapAlignment.center,
          children: alphabet.map((letter) => MaterialButton(
            minWidth: 10,

            child: Text(letter),
            padding: EdgeInsets.all(2.0),
            onPressed: lettersGuessed.contains(letter) ? null : () {
              widget._engine.guessLetter(letter);
            },
          )).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {



    return MaterialApp(

      title: 'IKU HANGMAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          onTap: () => {print(ModalRoute.of(context)?.settings.name),Navigator.pop(context), print(ModalRoute.of(context)?.settings.name),},
        ),
        title: Text('IKU Hangman'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image
            Expanded(
              child: Image.asset(_activeImage),
            ),
            // Word
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(_activeWord, style: activeWordStyle),
              ),
            ),
            // Controls
            Expanded(
              child: Center(
                child: this._renderBottomContent(),
              ),
            ),
          ],
        ),
      ),
    )

    );
  }
}