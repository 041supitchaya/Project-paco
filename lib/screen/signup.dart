import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paco_money/screen/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      backgroundColor: Color(0xFFF5A359),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Email",
                    style: const TextStyle(fontSize: 20),
                  ),
                  // TextFormFieldใช้กรอกอีเมลและรหัสผ่าน 
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Your email',
                    ),
                    validator: (value) { //validator เพื่อตรวจสอบว่าข้อมูลถูกต้องหรือไม่
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    onSaved: (newValue) => email = newValue!, //onSaved เพื่อบันทึกข้อมูลที่กรอกเมื่อมีการบันทึก
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Password",
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Your password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (newValue) => password = newValue!,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: const Text("SIGN UP", style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          // เชื่อมหน้า Signup success เชื่อมไปหน้า home login (เชื่อมเเบบ Navigator)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        } catch (e) {
                          // Signup failed
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




