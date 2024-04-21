import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paco Money',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(key: GlobalKey(), title: 'Paco Money'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5A359),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image.asset('image/logo4.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Paco Money',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
