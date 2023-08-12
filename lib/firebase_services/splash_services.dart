import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio_app/auth/login_screen.dart';
  
class SplashServices{

  void isLogin( BuildContext context){

    Timer(Duration (seconds:2 ), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>Loginscreen())));
  }
}