import 'diceBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' ;
import 'package:flutter/material.dart';

DicesBrain dicesBrain = DicesBrain();

void main() => runApp(Dicee()); 

class Dicee extends StatelessWidget{
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return DicePage();
  }

}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Roll a dice'),
          backgroundColor: Colors.red,
          actions: <Widget> [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dicesBrain.newGame();
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 32.0,
                  ),
                )
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: FlatButton(
                    child: Text(
                      'Next round',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        dicesBrain.restart();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                dicesBrain.leftDice.draw();
                                dicesBrain.getPoints();
                              });
                            },
                            child: Image.asset('images/dice${dicesBrain.leftDice.numberOfDice()}.png'),
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                dicesBrain.rightDice.draw();
                                dicesBrain.getPoints();
                              });
                            },
                            child: Image.asset('images/dice${dicesBrain.rightDice.numberOfDice()}.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Container(
                          child: Expanded(
                            child: Text(
                              '${dicesBrain.leftPoints()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${dicesBrain.rightPoints()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
