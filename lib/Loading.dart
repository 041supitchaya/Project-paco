import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paco_money/screen/home.dart';

class Loading extends StatefulWidget {
  Loading({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _loadData(); // เรียกเมธอด _loadData() เมื่อหน้า Loading ถูกสร้างขึ้น
  }

  // เมธอดเพื่อโหลดข้อมูล
  void _loadData() {
    // ใช้ Future.delayed() เพื่อทำให้มีการรอเป็นเวลา 3 วินาที
    Future.delayed(Duration(seconds: 3), () {
      // เมื่อโหลดเสร็จสมบูรณ์ ให้เปลี่ยนหน้าไปยัง HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

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
