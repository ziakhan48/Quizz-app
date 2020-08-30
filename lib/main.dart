import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Quiz_brain.dart';


Quizbrain qb=Quizbrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: Scaffold(
  backgroundColor: Colors.greenAccent,
  body: SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Quizzpage(),
    ),
  ),
),
    );
  }
}
class Quizzpage extends StatefulWidget {
  @override
  _QuizzpageState createState() => _QuizzpageState();
}


class _QuizzpageState extends State<Quizzpage> {
  List<Icon>scorekeeper = [];
    int correctans=0;
    int incoreans=0;

  void checkanser(bool userpickans) {
    bool correctanswers = qb.getcorretanswer();
    setState(() {
      if (userpickans == correctanswers) {
        scorekeeper.add(Icon(Icons.check, color: Colors.green,));
        correctans++;
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.red,));

        incoreans++;
      }

      if(qb.nextquestion() ==true){
        _confirmRegister();
        qb.questionnumberest(0);
        scorekeeper=[];
      };
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                  padding: EdgeInsets.all(10.0),

                  child: Center(
                    child: Text(

                      qb.getquestiontext(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )

              )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                  color: Colors.green,
                  child: Text('True',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  onPressed: () {
                    checkanser(true);
                  }
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                color: Colors.red,
                child: Text('False',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkanser(false);
                },
              ),
            ),
          ),
          Row(
            children: scorekeeper,
          )
        ]
    );
  }


  _confirmRegister() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Message'),
        content: Text(
            'quiz completed ...correctAns: $correctans Incorrect Ans $incoreans'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop();
              correctans=0;
              incoreans=0;
              // dismisses only the dialog and returns nothing
            },
            child: new Text('OK'),
          ),
        ],
      ),
    );
  }

}
