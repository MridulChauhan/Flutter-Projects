import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            title: Title(
                color: Colors.black, child: Center(child: Text('Wallpaper'))),
            backgroundColor: Colors.red),
        body: Center(
          child: Image(image: AssetImage('images/avengers.jpg')),
        ),
      ),
    ),
  );
}
