import 'package:flutter/material.dart';
import 'scan.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => First(), '/second': (context) => Scan()},
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.teal, scaffoldBackgroundColor: Colors.grey),
    );
  }
}

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ocro'),
      ),
      body: Center(
        child: Text('Welcome to my Optical character recognition App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 80.0,
          color: Colors.black87
        ),),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(Icons.home)),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Icon(Icons.add_a_photo),
          ),
          title: Text('Scan'),
        ),
      ]),
    );
  }
}
