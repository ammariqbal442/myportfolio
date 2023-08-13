import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_app/auth/signup_screen.dart';
import 'package:my_portfolio_app/auth/verifycode.dart';
import 'package:my_portfolio_app/utils/utilities.dart';

import '../widgets/round_button.dart';


class LoginWithPhone extends StatefulWidget {
   LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phonenumbercontroller =TextEditingController();
  final _formkey =GlobalKey<FormState>();
  bool loading =false;

  final _auth =FirebaseAuth.instance;

  void dispose(){
    super.dispose();
    phonenumbercontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: Text("Login With Phone"),
     ),
     body: Column(children: <Widget>[      
      SizedBox(height: 60,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:25),
        child: Form(
          key: _formkey,
          child: TextFormField(
            controller: phonenumbercontroller,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 15,
            color: Colors.black),
            decoration: InputDecoration(  
              hintText: 'Your phone number',
              helperText: 'Phone must be +92----'
            ),
             validator: (value){
              if (value!.isEmpty)
              {
                return 'Enter your Phone Number';
              }
              else {
                return null;
              }
            },
          ),
        ),
      ),
             SizedBox(height: 40,),
 Padding(
   padding: const EdgeInsets.symmetric(horizontal: 50),
   child: RoundButton(title:'Register',
   loading: loading,
     ontap: (){
   if (_formkey.currentState!.validate())
   {
    setState(() {
    loading=true;
  });

_auth.verifyPhoneNumber(
  phoneNumber: phonenumbercontroller.text,
  verificationCompleted: (_){
  }, 
  verificationFailed: (e){
    Utils().toastmessage(e.toString());
  }, 
   codeSent: (String verificationId, int ?token)
   {
setState(() {
    loading=false;
  });
Navigator.push(context, MaterialPageRoute(builder: (context) =>VerifyCode(verificationId:verificationId ,)));
     
   },
   codeAutoRetrievalTimeout: (e){
    Utils().toastmessage(e.toString());
  }, 
   
   
);
   

   }
   
     }
     ),
 ),
       Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           
           Padding(
          padding: const EdgeInsets.symmetric(vertical:30,),
          child: Text("If you Sign up with email and password",
          style: TextStyle(
            fontSize:14,
            fontWeight: FontWeight.w500,
          ),),
           ),
           TextButton(onPressed: (){
           
          Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen()));
           }, child: Text("Sign up",style: TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w500,
          ),)),
          SizedBox(height: 30,),

         ],
           ),
     
     ],),
    );
  }
}