import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/nav.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import '../screens/Overview.dart';
import '../models/User.dart';
import '../helper/navkey.dart';
import '../expction/nouserex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../expction/nopass.dart';
import '../expction/emailexistex.dart';
class AuthHelper extends ChangeNotifier {

UserMdoel? userAuth ;
  singup(String emailAddress, String password,BuildContext context, UserMdoel u)async{
 
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
 if(credential.user!=null){

  final url = Uri.parse('https://wellcome-ec07c-default-rtdb.firebaseio.com//Users/${credential.user!.uid}.json');

 final res = await post(url, body: json.encode({
      
    'name': u.name,
    'birth': u.birth.toString(),
   'gender': u.gender,
    'email': u.email,
   'phone': u.phoneNumber,
   'pass':u.password

 }));
 Map<String,dynamic> b = json.decode(res.body);
 u.id== b['name'];
 userAuth=u;
 /*
 final data =await SharedPreferences.getInstance();
 final userdata = json.encode({
"userId":userAuth!.id,
"userC":credential.user!.uid

 });
 data.setString("user", userdata);

*/
 

 
}
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    throw useremailEx('The account already exists for that email');
    //print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}


}/*
 Future<bool> autoLogIn()async{
 final data =await SharedPreferences.getInstance();
 if(!data.containsKey("user")){
print("false");
 return false;
 }else{
   final x =json.decode(data.getString("user")!)as Map<String,dynamic>;
 final url = await Uri.parse('https://wellcome-ec07c-default-rtdb.firebaseio.com//Users/${x['userC']}.json'); 
 final response = await get(url);
 final datac = json.decode(response.body) as Map<String,dynamic> ;
 print(datac);
 userAuth = UserMdoel(password:datac[x['userId']]['pass'],
  birth: DateTime.parse(datac[x['userId']]['birth']),
   email: datac[x['userId']]['email'], 
  gender: datac[x['userId']]['gender'],
   name: datac[x['userId']]['pass'],
    phoneNumber: datac[x['userId']]['phone']);
    notifyListeners();
   print("true");
return true;
 }


}
*/

singin(String emailAddress, String password,BuildContext context)async{
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
if(credential.user!=null){
 
   final url = Uri.parse('https://wellcome-ec07c-default-rtdb.firebaseio.com//Users/${credential.user!.uid}.json');
final res = await get(url);
final resbigbody = json.decode(res.body) as Map<String,dynamic>;
print(resbigbody);
final userid = resbigbody.keys.toList();
print(userid);
final list = resbigbody.values.toList();
final resbody = list[0];

userAuth = UserMdoel(password: resbody['pass'], 
id: userid[0],
birth: DateTime.parse(resbody['birth']),
 email: resbody['email'],
 gender: resbody['gender'], 
 name: resbody['name'], 
 phoneNumber: resbody['phone']);
}
final data =await SharedPreferences.getInstance();
 final userdata = json.encode({
"userId":userAuth!.id,
"userC":credential.user!.uid

 });
 print( userdata);
 data.setString("user", userdata);

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    throw NoUserEx("No user found for that email.");
   // print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
     throw NoPassex("Wrong password provided for that user");
   // print('Wrong password provided for that user.');
  }
}


}
logout()async{
  final bh = await SharedPreferences.getInstance();
  bh.clear();
  print(bh.getString("user"));
userAuth=null;
await FirebaseAuth.instance.signOut();
Custum_Nav.navigatorKey.currentState!.pushNamed('Log');

}
deleteuser(String uid)async{
  final url = Uri.parse('https://wellcome-ec07c-default-rtdb.firebaseio.com//Users/${uid}.json');
  await FirebaseAuth.instance.currentUser!.delete();
 final res =  await  delete(url);
Custum_Nav.navigatorKey.currentState!.pushReplacementNamed('Log');
}
}