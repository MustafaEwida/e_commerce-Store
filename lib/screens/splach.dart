

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/nav.dart';
import 'package:flutter_application_3/screens/LogIn_S.dart';
import 'package:flutter_application_3/screens/Overview.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import '../providers/Auth.dart';

class Splach extends StatefulWidget {
 
  @override
  State<Splach> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splach> {
 

  @override
  Widget build(BuildContext context) {
  
     Future.delayed(Duration(seconds: 2)).then((value){
  
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  LogIn_Screen()));
  } );
    return Scaffold(
   body: Stack(
    children: [
 Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height ,
     child: Image.asset('assets/preview.png',fit: BoxFit.cover,),
   
   
   /*
   392.72727272727275
I/flutter (12874): 803.6363636363636*/ 
     ),

     Positioned(
      top:MediaQuery.of(context).size.height-70 ,
      right: MediaQuery.of(context).size.width/2,
      
      child:CircularProgressIndicator() )

    ],
    
   ),



    );
  }
}