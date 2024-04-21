import 'package:flutter/material.dart';
import 'package:paco_money/screen/login.dart';
// import 'package:pacomoney/screen/signup.dart';
import 'package:paco_money/screen/signup.dart';
// import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register/Login"),
      ),
      backgroundColor: Color(0xFFF5A359), // เพิ่มพื้นหลังสี FFF18585
      body: Padding(
        
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Image.asset("image/duckling.png"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  // เชื่อมหน้า ไปหน้า login ใช้ push (เชื่อมเเบบ Navigator)
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return LoginScreen();
                    }),
                  );
                }, 
                icon: Icon(Icons.login), 
                label: Text("LOGIN",style: TextStyle(fontSize: 20))
                ),
              ),
              SizedBox(
                width: double.infinity,

                // เชื่อมหน้า ไปหน้า sing up ใช้ push (เชื่อมเเบบ Navigator)
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return SignupScreen();
                    }),
                  );
                }, 
                icon: Icon(Icons.add), 
                label: Text("SIGNUP",style: TextStyle(fontSize: 20))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}