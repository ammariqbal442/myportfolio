import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio_app/auth/signup_screen.dart';
import 'package:my_portfolio_app/utils/utilities.dart';
import 'package:my_portfolio_app/widgets/round_button.dart';

import 'homepage.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool loading =false;
  final _formkey =GlobalKey<FormState>();
  final emailcontroller =TextEditingController();
  final passowrdcontroller =TextEditingController();
void dispose(){

  super.dispose();
  passowrdcontroller.dispose();
  emailcontroller.dispose();
}
void login() {
  setState(() {
    loading = true;
  });

  _auth.signInWithEmailAndPassword(
    email: emailcontroller.text.toString(),
    password: passowrdcontroller.text.toString(),
  ).then((value) {
    String userEmail = value.user!.email.toString();
    Utils().toastmessage('User logged in successfully with: $userEmail');

    // Navigate to the homepage after successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()), // Replace Homepage with the actual name of your homepage widget
    );

    setState(() {
      loading = false;
    });

  }).catchError((error) {
    Utils().toastmessage('An error occurred: $error'); // Display error message
    
    setState(() {
      loading = false;
    });
  });
}

FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return 
    
    
     WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
       child: Scaffold(
      appBar:  AppBar(
       title: Text("Login"),
       automaticallyImplyLeading: true,
      ),
     
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
          SizedBox(height: 60,),
          Image.asset('assets/images/icon.png',height: 100,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Form(
         key: _formkey,
         child: Column(children: <Widget>[
           TextFormField(
              keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Your Email',
              helperText: 'email must be @gmail.com',
              suffixIcon: Icon(Icons.email_sharp)
           
            ),
                    validator: (value){
           
              if (value!.isEmpty)
              {
           
                return 'Enter your email';
              }
              else {
           
                return null;
              }
            },
           
           
            controller: emailcontroller,
          ),
           TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Your Password',
              
              helperText: 'Passord must be A-Z, 1-0,Characters with symbols',
              suffixIcon: Icon(Icons.lock)
           
            ),
            validator: (value){
           
              if (value!.isEmpty)
              {
           
                return 'Enter your Password';
              }
              else {
           
                return null;
              }
            },
            controller: passowrdcontroller,
          ),
          SizedBox(height: 20,),
           RoundButton(title:'Login',
           loading:loading,
        
        ontap: (){
           if (_formkey.currentState!.validate())
           {
            login();
          }
           
        }
        ),
           
           Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           
           Padding(
          padding: const EdgeInsets.symmetric(vertical:20),
          child: Text("You do not have account",
          style: TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w500,
          ),),
           ),
           TextButton(onPressed: (){
           
          Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen()));
           }, child: Text("Sign up",style: TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w500,
          ),))
         ],
           )
        ],)),
      ),
        
         ],
        ),
      ),
         
     );
  }
}