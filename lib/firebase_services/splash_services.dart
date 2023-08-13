import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_app/auth/homepage.dart';
import 'package:my_portfolio_app/auth/login_screen.dart';
  
class SplashServices{
  void isLogin( BuildContext context){
    final auth =FirebaseAuth.instance;
    final user = auth.currentUser;

if (user!=null)
{
  Timer(Duration (seconds:2 ), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>Homepage())));

}

else {

    Timer(Duration (seconds:2 ), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>Loginscreen())));

}  
  }
}