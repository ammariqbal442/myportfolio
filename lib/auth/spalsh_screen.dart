// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:my_portfolio_app/firebase_services/splash_services.dart';



// ignore: camel_case_types
class Spalash_screen extends StatefulWidget {
  const Spalash_screen({super.key});

  @override
  State<Spalash_screen> createState() => _Spalash_screenState();
}

// ignore: camel_case_types
class _Spalash_screenState extends State<Spalash_screen> {
SplashServices  spalsh_screen = SplashServices();

void initState(){
  super.initState();
  spalsh_screen.isLogin(context);
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (

      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Center(child: 
          Text("Your Application Starting",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),))
        ],
      )),
    );
  }
}