import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utilities.dart';
import 'login_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text("Home"),
  actions: [
    IconButton(
      onPressed: () {
        auth.signOut().then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
        }).catchError((error) {
          Utils().toastmessage('An error occurred while logging out: $error'); // Display error message
        });
      },
      icon: Icon(Icons.logout_sharp),
    ),
  ],
),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
Text("Your content here bro",style: TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w800
),)
        ],
      ),
    );
  }
}