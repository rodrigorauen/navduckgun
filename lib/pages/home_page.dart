import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duck Gun'),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Text('Tela inicial aqui :)',
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.white
        )),
      ),
    );
  }
}