import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "what's your favourite color?",
      'answers': [
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Black', 'score': 7}
      ],
    },
    {
      'questionText': "what's your favourite icecream?",
      'answers': [
        {'text': 'Vanilla', 'score': 7},
        {'text': 'Chocolate', 'score': 5},
        {'text': 'Black Current', 'score': 2},
        {'text': 'Butter Scotch', 'score': 10}
      ],
    },
    {
      'questionText': "which one is your favourite car?",
      'answers': [
        {'text': 'Audi S8', 'score': 2},
        {'text': 'Mercedes S63', 'score': 5},
        {'text': 'BMW m8', 'score': 10},
        {'text': 'Maserati MC20', 'score': 7}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    // if (_questionIndex == questions.length) {
    //   _questionIndex = 0;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Guide'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
