import 'package:flutter/material.dart';
import 'package:my_portfolio_app/widgets/round_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formkey =GlobalKey<FormState>();
  final emailcontroller =TextEditingController();
  final passowrdcontroller =TextEditingController();
void dispose(){

  super.dispose();
  passowrdcontroller.dispose();
  emailcontroller.dispose();
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar:  AppBar(
  title: Text("Login"),
  automaticallyImplyLeading: true,
 ),

 body: Padding(
   padding:  EdgeInsets.symmetric(horizontal:20),

   child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
 

 Form(
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
 
 ontap: (){
if (_formkey.currentState!.validate())
{


}

 }
 ),
    

 ],)),
      
    ],
   ),
 ),
    );
  }
}