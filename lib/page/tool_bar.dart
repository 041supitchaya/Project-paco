import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/home_page.dart';
import 'package:paco_money/page/wallet.dart';
import 'package:paco_money/page/analytics.dart';
import 'package:paco_money/screen/login.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          homepage(), 
          WalletPage(),
          analytics(), 
          LoginScreen(), 
        ],
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 66,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFFFF5C0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildToolbarButton('image/book.png', 'Home', 0),
              _buildToolbarButton('image/wallet.png', 'Wallet', 1),
              _buildToolbarButton('image/analytics.png', 'Analytics', 2),
              _buildToolbarButton('image/logout.png', 'Logout', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolbarButton(String iconPath, String text, int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Padding(
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
      ),
    );
  }
}

