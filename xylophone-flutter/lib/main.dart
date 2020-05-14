import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  Expanded buildKey({int soundNo, Color Colour, String SongName}) {
    return Expanded(
      child: FlatButton(
        color: Colour,
        onPressed: () {
          assetsAudioPlayer.open(Audio("assets/audios/Song$soundNo.mp3"));
        },
        child: Text('Play$SongName'),
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
              buildKey(
                  soundNo: 7,
                  Colour: Colors.redAccent,
                  SongName: '01 - I Hate Luv Storys'),
              buildKey(
                  soundNo: 1,
                  Colour: Colors.blueAccent,
                  SongName: '02 Haareya (Arijit Singh)'),
              buildKey(
                  soundNo: 2,
                  Colour: Colors.greenAccent,
                  SongName: '03 Raabta - Title Song (Arijit Singh)'),
              buildKey(
                  soundNo: 3,
                  Colour: Colors.yellowAccent,
                  SongName: '04 - Gone Gone Gone'),
              buildKey(
                  soundNo: 4,
                  Colour: Colors.pinkAccent,
                  SongName: '05 - Kabira'),
              buildKey(
                  soundNo: 5,
                  Colour: Colors.orangeAccent,
                  SongName: '06 Roke Na Ruke Naina (Arijit Singh)'),
              buildKey(
                  soundNo: 6,
                  Colour: Colors.tealAccent,
                  SongName: '07 Humsafar (Akhil Sachdeva)'),
              FloatingActionButton(
                onPressed: () {
                  assetsAudioPlayer.playOrPause();
                },
                child: Text('Stop'),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
