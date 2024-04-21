import 'package:flutter/material.dart';
import 'package:paco_money/page/tool_bar.dart';

class analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // สร้างตัวแปรสำหรับข้อความที่จะแสดง
    String expenseText = "รายจ่าย";
    String expenseDetailText = "เติมน้ำมัน 1500 บาท";
    String incomeText = "รายรับ";
    String incomeDetailText = "เงินเดือน 19000 บาท";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar:ToolBar() , // เรียกใช้ function หน้า ToolBar
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
            // สี่เหลี่ยมสีเหลือง
            // Container for the rectangle
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 680, // ความสูงของสี่เหลี่ยม
                width: 412, // ความกว้างของสี่เหลี่ยม
                decoration: BoxDecoration(
                  color: Color(0xFFFCDA78), // สี FCDA78
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), // มุมบนซ้าย
                    topRight: Radius.circular(30), // มุมบนขวา
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ข้อความ "รายจ่าย"
                    Text(
                      expenseText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ข้อความ "เติมน้ำมัน 1500 บาท"
                    Text(
                      expenseDetailText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20), // ระยะห่างระหว่างข้อความ
                    // ข้อความ "รายรับ"
                    Text(
                      incomeText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ข้อความ "เงินเดือน 19000 บาท"
                    Text(
                      incomeDetailText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
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
      padding: const EdgeInsets.symmetric(horizontal: 24), // Add horizontal padding
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
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
