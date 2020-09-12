import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex == 3) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "what's your favourite color?",
        'answers': ['Red', 'Green', 'Blue', 'Black'],
      },
      {
        'questionText': "what's your favourite icecream?",
        'answers': ['Vanilla', 'Chocolate', 'Black Current', 'Butter Scotch'],
      },
      {
        'questionText': "which one is your favourite car?",
        'answers': ['BMW m8', 'Mercedes S63', 'Audi S8', 'Maserati MC20'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Guide'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
