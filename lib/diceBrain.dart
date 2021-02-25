import 'dice.dart';

class DicesBrain{
  Dice leftDice = Dice();
  Dice rightDice = Dice();

  int _leftPoints = 0;
  int _rightPoints = 0;

  void newGame(){
    this.restart();
    _leftPoints = 0;
    _rightPoints = 0;

  }
  void restart() {
    leftDice.restart();
    rightDice.restart();
  }

  void getPoints() {
    if(leftDice.clicked() & rightDice.clicked()) {
      if(leftDice.numberOfDice() > rightDice.numberOfDice()){
        this._leftPoints++;
      }else if(leftDice.numberOfDice() < rightDice.numberOfDice()) {
        this._rightPoints++;
      }
      leftDice.unClick();
      rightDice.unClick();
    }
  }

  int leftPoints() {
    return _leftPoints;
  }

  int rightPoints() {
    return _rightPoints;
  }
}