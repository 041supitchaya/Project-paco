import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/wallet.dart';
import 'package:paco_money/page/analytics.dart';
import 'package:paco_money/screen/login.dart';
import 'package:paco_money/history/history1.dart';
import 'package:paco_money/history/history2.dart';

// void main() {
//   runApp(MyApp());
// }

class homepage extends StatelessWidget {
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
            'หนังสือเริ่มต้น',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: Stack(
          children: [
            // รูป 'book.png' และข้อความ "หนังสือเริ่มต้น"
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'image/book.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'หนังสือเริ่มต้น',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // สี่เหลี่ยมสีเหลืองใหญ่
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height - 160,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCDA78),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCDA78),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // Total money
                          child: Center(
                            child: Text(
                              '\฿17,500.00',
                              style: TextStyle(
                                color: Color(0xFFF5A359),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Transactions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // ประวัติการซื้อน้ำมัน
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            // เชื่อมไปหน้า history1
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => history1()),
                                );
                              },
                            child: ListTile(
                              leading: Image.asset('image/oil.png'),
                              title: Text('Oil'),
                              subtitle: Text('2024-03-15'),
                              trailing: Text('\- ฿1500.00',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),    
                          );
                        },
                      ),
                      // ประวัติเงินเดือน
                        SizedBox(height: 10),
                        // เชื่อมไปหน้า history2
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => history2()),
                            );
                          },
                          child: ListTile(
                            leading: Image.asset('image/salary.png'),
                            title: Text('salary'),
                            subtitle: Text('2024-02-1'),
                            trailing: Text('\+ ฿19000.00',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // สร้างสี่เหลี่ยม +add
            Positioned(
              bottom: 84,
              right: 10,
              child: Container(
                height: 64, // ความสูงของสี่เหลี่ยม
                width: 64, // ความกว้างของสี่เหลี่ยม
                child: Stack(
                  children: [
                    // สี่เหลี่ยมสีเหลือง
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 204, 61), // สี FCDA78
                          borderRadius: BorderRadius.circular(20), // รัศมีความโค้งทุกด้าน 30
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // เงาสีดำ 20%
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // ตำแหน่งเงา
                            ),
                          ],
                        ),
                      ),
                    ),
                    // รูป pen อยู่ตรงกลางของสี่เหลี่ยม
                    Positioned(
                      top: 17, // ระยะตำแหน่งจากด้านบน
                      left: 17, // ระยะตำแหน่งจากด้านซ้าย
                      child: Image.asset(
                        'image/pen.png', // เปลี่ยนเป็นพาทของรูป pen ของคุณ
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // toolbar ข้างล่าง
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 66,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFFFF5C0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToolbarButton(context, 'image/book.png', 'Home'),
                    _buildToolbarButton(context,'image/wallet.png', 'Wallet'),
                    _buildToolbarButton(context,'image/analytics.png', 'Analytics'),
                    _buildToolbarButton(context,'image/logout.png', 'Logout'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbarButton(context, String iconPath, String text) {
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
}