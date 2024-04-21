import 'package:flutter/material.dart';
// import path หน้าที่ต้องการเชื่อม ของ tool bar
import 'package:paco_money/page/home_page.dart';
import 'package:paco_money/page/wallet.dart';
import 'package:paco_money/page/analytics.dart';
import 'package:paco_money/screen/home.dart';
import 'package:paco_money/page/tool_bar.dart';

class ToolBar extends StatefulWidget {
  ToolBar({Key? key}) : super(key: key);

  @override
  State<ToolBar> createState() => _HomeState();
}

class _HomeState extends State<ToolBar> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
      // // body: PageView(
      // //   controller: _pageController,
      // //   children: [
      // //     homepage(),
      // //     WalletPage(),
      // //     analytics(),
      // //     HomeScreen(),
      // //   ],
      // // ),
      // bottomNavigationBar: Align(
      //   alignment: Alignment.bottomCenter,
        // child:
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFFFF5C0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildToolbarButton('image/book.png', 'Home', 0, () {
                _navigateToPage(context, homepage());
              }),
              _buildToolbarButton('image/wallet.png', 'Wallet', 1, () {
                _navigateToPage(context, WalletPage());
              }),
              _buildToolbarButton('image/analytics.png', 'Analytics', 2, () {
                _navigateToPage(context, analytics());
              }),
              _buildToolbarButton('image/logout.png', 'Logout', 3, () {
                _navigateToPage(context, HomeScreen());
              }),
            ],
          ),
        );
      // ),
    // );
  }

  Widget _buildToolbarButton(
      String iconPath, String text, int index, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
