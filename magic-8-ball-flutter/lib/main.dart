import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          margin: EdgeInsets.all(20),
          color: Colors.black,
          child: Text(
            'What do you have in mind',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        SizedBox(height: 10),
        FlatButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(
              () {
                ballNumber = Random().nextInt(5) + 1;
              },
            );
          },
        ),
      ],
    );
  }
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('Ask Me Anything'),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network(
            'https://wallpaperscute.com/wp-content/uploads/2018/02/Abstract-Vector-Mobile-Wallpaper-HD.jpg',
          ),
          Ball(),
        ],
      ),
    );
  }
}
