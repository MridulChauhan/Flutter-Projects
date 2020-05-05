import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  Widget buildKey({int soundNo, Color Colour}) {
    return Expanded(
      child: FlatButton(
        color: Colour,
        onPressed: () {
          player.play('note$soundNo.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text('Musical')),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildKey(soundNo: 1, Colour: Colors.redAccent),
              buildKey(soundNo: 2, Colour: Colors.blueAccent),
              buildKey(soundNo: 3, Colour: Colors.greenAccent),
              buildKey(soundNo: 4, Colour: Colors.yellowAccent),
              buildKey(soundNo: 5, Colour: Colors.pinkAccent),
              buildKey(soundNo: 6, Colour: Colors.orangeAccent),
              buildKey(soundNo: 7, Colour: Colors.tealAccent),
            ],
          ),
        ),
      ),
    );
  }
}
