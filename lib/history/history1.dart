import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/home_page.dart';
// import 'package:paco_money/page/wallet.dart';
// import 'package:paco_money/page/analytics.dart';
// import 'package:paco_money/screen/login.dart';
import 'package:paco_money/page/tool_bar.dart';

class history1 extends StatefulWidget {
  @override
  _history1State createState() => _history1State();
}

class _history1State extends State<history1> {
  bool dataDeleted = false;
   // Method to navigate to the homepage
  void _navigateToHomepage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => homepage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar:ToolBar() , // เรียกใช้ function หน้า ToolBar
        backgroundColor: Color(0xFFF5A359), // กำหนดพื้นหลังของทั้งหน้าจอเป็นสี F5A359
        appBar: AppBar(
          backgroundColor: Colors.transparent, // กำหนดสีพื้นหลังของแอปบาร์เป็นสีโปร่งใส
          elevation: 0, // กำหนดค่า elevation เป็น 0 เพื่อลบเงาของแอปบาร์
          title: Text(
            'รายละเอียด',
            style: TextStyle(
              color: Colors.white, // กำหนดสีของข้อความเป็นสีขาว
              fontSize: 32, // กำหนดขนาดตัวอักษรเป็น 32
            ),
          ),
          centerTitle: true, // จัดวางข้อความตรงกลาง
          // icon ปุ่มลบหน้า
          actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    dataDeleted = true;
                  });
                  _navigateToHomepage(); // นำทางไปยังหน้า homepage
                },
              ),
            ],
          ),
        
        body: Stack(
          children: [
            // สี่เหลี่ยมสีเหลือง
            // Container for the rectangle
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: dataDeleted ? 0 : 680,
                width: 412, // Width of the yellow rectangle
                decoration: BoxDecoration(
                  color: Color(0xFFFCDA78), // Yellow color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), // Top-left corner radius
                    topRight: Radius.circular(30), // Top-right corner radius
                  ),
                ),
              ),
            ),

            // เก็บข้อมูล icon
            Positioned(
              bottom: 130,
              left: 55, // Adjust based on your design
              child: Container(
                height: 80, 
                width: 300, 
                decoration: BoxDecoration(
                  color: Color(0xFFFFF5C0), 
                  borderRadius: BorderRadius.circular(30), 
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset('image/oil.png'),
                      title: Text('Oil'),
                      subtitle: Text('2024-03-15'),
                      trailing: Text('\- ฿1500.00',
                      style: TextStyle(
                        color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

              // รูป filling_station.jpg
              Positioned(
                top: 124,
                left: (MediaQuery.of(context).size.width - 280) / 2, // Centered horizontally
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/filling station.jpg'), // เปลี่ยนรูปภาพเป็น filling_station.jpg
                      fit: BoxFit.cover, // ให้รูปภาพขยายเต็มพื้นที่
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              // ข้อความ "เติมน้ำมันตอนไปเที่ยว"
              Positioned(
                top: 350,
                left: (MediaQuery.of(context).size.width - 331) / 2, // Centered horizontally
                child: Container(
                  height: 150,
                  width: 331,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'เติมน้ำมันตอนไปเที่ยว',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

            // // toolbar ข้างล่าง
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 66,
            //     width: MediaQuery.of(context).size.width, // กำหนดความกว้างเต็มหน้าจอ
            //     color: Color(0xFFFFF5C0), // เปลี่ยนสีเป็น FFF5C0
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         _buildToolbarButton('image/book.png', 'Home'), // ปุ่ม Home
            //         _buildToolbarButton('image/wallet.png', 'Wallet'), // ปุ่ม Wallet
            //         _buildToolbarButton('image/analytics.png', 'Analytics'), // ปุ่ม Analytics
            //         _buildToolbarButton('image/logout.png', 'Logout'), // ปุ่ม Logout
            //       ],
            //     ),
            //   ),
            // ),
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
