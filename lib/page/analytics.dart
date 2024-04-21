import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/home_page.dart';
import 'package:paco_money/page/wallet.dart';
import 'package:paco_money/screen/login.dart';

// void main() {
//   runApp(MyApp());
// }

class analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF5A359),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'การวิเคราะห์',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 680,
                width: 412,
                decoration: BoxDecoration(
                  color: Color(0xFFFCDA78),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          // Draw the graph here
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildGraphLine(Color(0xFFFF4F4F), "ค่าน้ำมัน", 1), // เส้นสีแดง
                              _buildGraphLine(Color(0xFF4CAF50), "ค่าอาหาร", 1), // เส้นสีเขียว
                              _buildGraphLine(Color(0xFF2196F3), "ช็อปปิ้ง", 1), // เส้นสีน้ำเงิน
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "ค่าใช้จ่ายทั้งหมด",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "12000",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red, // สีแดง
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 66,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFFFF5C0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToolbarButton('image/book.png', 'Home'),
                    _buildToolbarButton('image/wallet.png', 'Wallet'),
                    _buildToolbarButton('image/analytics.png', 'Analytics'),
                    _buildToolbarButton('image/logout.png', 'Logout'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Building template for toolbar button
  Widget _buildToolbarButton(String iconPath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 35,
            height: 35,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Building template for graph line
  Widget _buildGraphLine(Color color, String text, double thickness) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color, width: thickness),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
