import 'dart:math';

class Dice {
  int _number = 0;
  bool _clicked = false;

  void restart() {
    this._clicked = false;
    this._number = 0;
  }

  void unClick (){
    this._clicked = false;
  }

  void draw(){
    this._number = Random().nextInt(6) + 1;
    this._clicked = true;
  }

  int numberOfDice() {
    return this._number;
  }

  bool clicked(){
    return this._clicked;
  }
}