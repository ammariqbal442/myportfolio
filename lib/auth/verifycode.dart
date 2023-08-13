

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../widgets/round_button.dart';
import 'homepage.dart';


class VerifyCode extends StatefulWidget {
  final String verificationId;
   VerifyCode({super.key,required this.verificationId });

  @override
  State<VerifyCode> createState() => _VerifyCodePhoneState();
}

class _VerifyCodePhoneState extends State<VerifyCode> {
  
  @override
 final verificationcodecontroller =TextEditingController();
  final _formkey =GlobalKey<FormState>();
  bool loading =false;

  final _auth =FirebaseAuth.instance;

  void dispose(){
    super.dispose();
    verificationcodecontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(

     appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: Text("Verify"),
     ),
     body: Column(children: <Widget>[
      
      SizedBox(height: 60,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal:25),

        child: Form(
          key: _formkey,
          child: TextFormField(
            controller: verificationcodecontroller,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 15,
            color: Colors.black),
            decoration: InputDecoration(  
              hintText: '---------',
              helperText: 'Code will expire after 1 minute'
              
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
   child: RoundButton(title:'Verify',
   loading: loading,
     
     ontap: () async{
   if (_formkey.currentState!.validate())
   
   {
setState(() {
    loading=true;
  });
   final credential = PhoneAuthProvider.credential(verificationId: 
   widget.verificationId,
    smsCode: verificationcodecontroller.text.toString());

try {
  await _auth.signInWithCredential(credential);
  
Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()), // Replace HomeScreen with your actual home page
    );
} catch (e) {
  // Handle the exception here

  setState(() {
    loading=false;
  });
  print("An error occurred during sign-in: $e");
}

   }
   
     }
     ),
 ),
     
     ],),
    );
  }
}