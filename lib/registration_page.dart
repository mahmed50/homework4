import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void registerUser() async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Save user info to Firestore
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'role': 'user', // Adjust as necessary
      'registration_datetime': DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
          TextField(controller: firstNameController, decoration: InputDecoration(labelText: 'First Name')),
          TextField(controller: lastNameController, decoration: InputDecoration(labelText: 'Last Name')),
          ElevatedButton(onPressed: registerUser, child: Text('Register')),
        ],
      ),
    );
  }
}