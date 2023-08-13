import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title; 
  final VoidCallback ontap;
 final  bool loading;
   RoundButton({super.key,
  required this.loading,
  required this.title,
   required this.ontap,
  });


  @override
  Widget build(BuildContext context) { 
    return 
     InkWell(
      onTap: ontap,
       child: Container(
     height: 50,
     decoration: BoxDecoration(
     color: Colors.red,
     borderRadius: BorderRadius.circular(40)
     ),
     child: Center(
       child: loading ? CircularProgressIndicator(
        strokeWidth: 3,color: Colors.white,
       ):   Text(title,
       style: TextStyle(color: Colors.white),
       ),
     )
     
         ),
     );
  }
}