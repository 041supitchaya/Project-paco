import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
// import 'package:paco_money/page/home_page.dart';
// import 'package:paco_money/page/analytics.dart';
// import 'package:paco_money/screen/login.dart';
// import 'package:paco_money/note/expenses.dart';
import 'package:paco_money/note/Save wallet.dart';
import 'package:paco_money/page/tool_bar.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:ToolBar() , // เรียกใช้ function หน้า ToolBar
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => save_wallet()), // ใช้ MaterialPageRoute เพื่อนำทางไปยังหน้า SaveWalletPage
          );
        },
        child: Image.asset(
          'image/pen.png', // เปลี่ยนเป็นพาทของรูป pen ของคุณ
          width: 36,
          height: 36,
        ),
        backgroundColor: Color(0xFFFCDA78),
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