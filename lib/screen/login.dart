import 'package:flutter/material.dart';
import 'package:paco_money/model/profile.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Profile profile = Profile(email: '', password: '');

  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      backgroundColor: Color(0xFFF5A359), // เพิ่มพื้นหลังสี FFF18585
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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null; // Valid email
                    },
                    onSaved: (newValue) => email = newValue,
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
                      return null; // Valid password (consider adding complexity rules)
                    },
                    onSaved: (newValue) => password = newValue,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: const Text("LOGIN", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        // Handle signup logic here
                        //  - Call a backend API for user registration
                        //  - Show a success/error message
                        //  - Navigate to the next screen
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
