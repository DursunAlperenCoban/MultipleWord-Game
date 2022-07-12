import 'package:flutter/material.dart';
import 'package:word_game_multiple/wordle/input_button.dart';


class InputKeyboard extends StatelessWidget {
  final Function toWord;
  final Function delChar;
  final Function enterTheWord;


  InputKeyboard(
      {required this.toWord,
      required this.delChar,
      required this.enterTheWord,
      });

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    List<String> secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    List<String> thirdRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

    return Container(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: firstRow.map((letter) {
                return Container(
                  margin: EdgeInsets.all(2),
                  child: InputButton(letter: letter, letterPressed: toWord,),
                  width: 35,
                );
              }).toList()),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: secondRow.map((letter) {
                return Container(
                    margin: EdgeInsets.all(2),
                    child: InputButton(letter: letter, letterPressed: toWord,),
                    width: 35);
              }).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                child: ElevatedButton(
                  child: Text('Enter'),
                  onPressed: () => enterTheWord(),
                  style: ElevatedButton.styleFrom(primary: Color(0xff818384)),
                ),
              ),
              ...thirdRow.map((letter) {
                return Container(
                    margin: EdgeInsets.all(2),
                    child: InputButton(
                      letter: letter,
                      letterPressed: toWord,

                    ),
                    width: 35);
              }).toList(),
              Container(
                margin: EdgeInsets.all(2),
                child: InputButton(letter: 'Del', letterPressed: delChar,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
