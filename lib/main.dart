import 'package:flutter/material.dart';
import 'package:word_game_multiple/game_selection.dart';
import 'package:word_game_multiple/hangman/hangmanMainPage.dart';
import 'package:word_game_multiple/hangman/ui/hangman_page.dart';
import 'package:word_game_multiple/wordhunt/pages/home.dart';
import 'package:word_game_multiple/wordhunt/wordHuntMainPage.dart';
import 'package:word_game_multiple/wordle/screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => GameSelection(),
        '/wordle': (context) => Screen(),
        '/hangman':(context) => HangmanPage(),
        '/wordhunt':(context) => HomePage(),


      },

    );
  }
}

