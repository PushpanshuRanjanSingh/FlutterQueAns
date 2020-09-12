import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final num resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPharse {
    String resultText;
    if (resultScore >= 25) {
      resultText = 'You are awesome !!! $resultScore';
    } else if (resultScore >= 20) {
      resultText = 'You are Preety likeable !! $resultScore';
    } else if (resultScore >= 15) {
      resultText = 'You are Okay! $resultScore';
    } else {
      resultText = 'You are Shit 💩 $resultScore';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPharse,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
