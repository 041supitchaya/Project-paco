import 'package:flutter/material.dart';
import 'package:paco_money/screen/home.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:paco_money/page/tool_bar.dart';
import 'package:paco_money/page/home_page.dart';
import 'package:paco_money/history/history1.dart';
import 'package:paco_money/Loading.dart';
// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paco  money',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(248, 140, 63, 1)),
        useMaterial3: true,
      ),
      home: Loading(title: 'Loading...')
      // home: homepage()
      // home: HomeScreen() // class HomeScreen เป็นหน้าเเรกในการ run
    );
  }
}
