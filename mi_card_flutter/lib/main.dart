import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/mridul.jpg'),
              ),
              Text(
                'Mridul Chauhan',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 5,
                width: 150,
                child: Divider(color: Colors.white, thickness: 1),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    '+91 9080956254',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal.shade900),
                  title: Text(
                    'abc123@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
