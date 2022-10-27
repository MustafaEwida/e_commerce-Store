

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/Auth.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/helper/navkey.dart';
import 'package:flutter_application_3/providers/provider.dart';
import 'package:flutter_application_3/screens/nav.dart';
import 'package:flutter_application_3/screens/settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class AppDrwer extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
      final user = Provider.of<AuthHelper>(context).userAuth;
    return Drawer(
 child: Column(
children: [
Container(
  alignment: Alignment.center,
  color: Theme.of(context).primaryColor,
  width: double.infinity,
  height: 200.h,
  child:ListTile(
    leading:  CircleAvatar(
        backgroundColor: Colors.white,
        radius: 34.sp,
        child: Icon(Icons.person, color: Colors.black,size: 30,),
      ),
      title: Text(user!.name!,style: TextStyle(color: Colors.white),),
      subtitle:FittedBox(child: Text(user.email!,style: TextStyle(color: Colors.white))) ,
  ),
),
ListTile(leading: Icon(Icons.person_outlined),title: Text("Profile"),onTap: (){
  Custum_Nav.navigatorKey.currentState!.pushNamed('profile');
},),

ListTile(leading: Icon(Icons.settings),title: Text("Settings"),onTap: (){
Custum_Nav.navigatorKey.currentState!.push(MaterialPageRoute(builder: ((context) {
 return Settings_screen();
})));
},),

ListTile(leading: Icon(Icons.logout),title: Text("LogOut"),onTap: (){
  Provider.of<AuthHelper>(context,listen: false).logout();
},)













],






 ),




    );
  }
}