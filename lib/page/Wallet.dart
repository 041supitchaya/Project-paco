import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/home_page.dart';
import 'package:paco_money/page/analytics.dart';
import 'package:paco_money/screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletPage(),
    );
  }
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'กระเป๋าเงิน',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFFF5A359),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFFFCDA78),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'สินทรัพย์สุทธิ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:24),
                Text(
                  '\฿17,500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFFCDA78),
              child: ListView(
                children: [
                  TransactionTile(
                    imagePath: 'image/money_wallet.png',
                    title: 'Wallet1',
                    amount: '\฿2,000',
                  ),
                  TransactionTile(
                    imagePath: 'image/piggy.png',
                    title: 'Wallet2',
                    amount: '\฿3,000',
                  ),
                  TransactionTile(
                    imagePath: 'image/credit.png',
                    title: 'Credit',
                    amount: '\฿12,500',
                  ),
                  TransactionTile(
                    imagePath: 'image/debit.png',
                    title: 'Debit',
                    amount: '\฿0',
                  ),
                  // Add more transaction tiles as needed
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add a new transaction
        },
        child: Image.asset(
            'image/pen.png', // เปลี่ยนเป็นพาทของรูป pen ของคุณ
            width: 36,
            height: 36,
          ),
        // child: Icon(Icons.add),
        backgroundColor: Color(0xFFFCDA78),
      ),
      bottomNavigationBar: BottomAppBar(
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
    );
  }

  Widget _buildToolbarButton(String iconPath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 30,
            height: 30,
          ),
          SizedBox(height: 4),
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

class TransactionTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String amount;

  TransactionTile({
    required this.imagePath,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
      title: Text(title),
      trailing: Text(amount),
    );
  }
}