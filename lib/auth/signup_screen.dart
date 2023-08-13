

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:my_portfolio_app/auth/homepage.dart';
import 'package:my_portfolio_app/auth/login_screen.dart';
import 'package:my_portfolio_app/utils/utilities.dart';
import 'package:my_portfolio_app/widgets/round_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
bool loading =false;
  final _formkey =GlobalKey<FormState>();
  final emailcontroller =TextEditingController();
  final passowrdcontroller =TextEditingController();
void dispose(){

  super.dispose();
  passowrdcontroller.dispose();
  emailcontroller.dispose();
}

FirebaseAuth _auth = FirebaseAuth.instance;

void signup(){
  
  setState(() {
    loading =true;
  });

_auth.createUserWithEmailAndPassword(
  email: emailcontroller.text.toString(),
   password: passowrdcontroller.text.toString()).then((value)
   {
  setState(() {
    loading =false;
  });
  
Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()), // Replace HomeScreen with your actual home page
    );
   }
   

).onError((error, stackTrace) 
{
  Utils().toastmessage(error.toString());
    setState(() {
    loading =false;
  });

});

}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar:  AppBar(
  title: Text("Sign Up"),
  automaticallyImplyLeading: true,
 ),

 body: 

   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
 

 Padding(
   padding:  EdgeInsets.symmetric(horizontal:20),
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
            else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    } 
            else {
 
              return null;
            }
          },
          controller: passowrdcontroller,
        ),
        SizedBox(height: 20,),
 RoundButton(title:'Sign Up',
 loading: loading,
   
   ontap: (){
 if (_formkey.currentState!.validate())
 
 {
 signup();
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
 
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Loginscreen()));
      }, child: Text("Login In",style: TextStyle(
          fontSize:16,
          fontWeight: FontWeight.w500,
        ),))
    ],
 )
   ],)),
 ),
      
    ],
   ),
 
    );
  }
}