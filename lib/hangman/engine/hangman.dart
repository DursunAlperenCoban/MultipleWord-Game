import 'dart:async';

class HangmanGame {
  static const int hanged = 7;

  final List<String> wordList;
  final Set<String> lettersGuessed = new Set<String>();

  List<String> _wordToGuess = List<String>.filled(5, '',growable: true);
  int _wrongGuesses =0;

  StreamController<Null> _onWin = new StreamController<Null>.broadcast();
  Stream<Null> get onWin => _onWin.stream;

  StreamController<Null> _onLose = new StreamController<Null>.broadcast();
  Stream<Null> get onLose => _onLose.stream;

  StreamController<int> _onWrong = new StreamController<int>.broadcast();
  Stream<int> get onWrong => _onWrong.stream;

  StreamController<String> _onRight = new StreamController<String>.broadcast();
  Stream<String> get onRight => _onRight.stream;

  StreamController<String> _onChange = new StreamController<String>.broadcast();
  Stream<String> get onChange => _onChange.stream;

  HangmanGame(List<String> words) : wordList = new List<String>.from(words);

  void newGame() {

    wordList.shuffle();


    _wordToGuess = wordList.first.split('');

    print(_wordToGuess);
    _wrongGuesses = 0;

    lettersGuessed.clear();

    _onChange.add(wordForDisplay);
  }

  void guessLetter(String letter) {

    lettersGuessed.add(letter);

    if (_wordToGuess.contains(letter)) {
      _onRight.add(letter);

      if (isWordComplete) {
        _onChange.add(fullWord);
        _onWin.add(null);
      }
      else {
        _onChange.add(wordForDisplay);
      }
    }
    else {
      _wrongGuesses++;

      _onWrong.add(_wrongGuesses);

      if (_wrongGuesses == hanged) {
        _onChange.add(fullWord);
        _onLose.add(null);
      }
    }
  }

  int get wrongGuesses => _wrongGuesses;
  List<String> get wordToGuess => _wordToGuess;
  String get fullWord => wordToGuess.join();

  String get wordForDisplay => wordToGuess.map((String letter) =>
    lettersGuessed.contains(letter) ? letter : "_").join();


  bool get isWordComplete {
    for (String letter in _wordToGuess) {
      if (!lettersGuessed.contains(letter)) {
        return false;
      }
    }

    return true;
  }
}