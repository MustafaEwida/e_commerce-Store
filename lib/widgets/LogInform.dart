



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/providers/Auth.dart';
import 'package:flutter_application_3/screens/nav.dart';
import 'package:flutter_application_3/providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import '../screens/sgin.dart';
import '../expction/nopass.dart';
import '../expction/nouserex.dart';
class Log_form extends StatefulWidget {


  @override
  State<Log_form> createState() => _Log_formState();
}

class _Log_formState extends State<Log_form> {
  bool isload = false;
 List<String> user = ['',''];
  GlobalKey<FormState> _form = GlobalKey();
  FocusNode pass = FocusNode();

onSvaed()async{
if(_form.currentState!.validate()){
 _form.currentState!.save();
 setState(() {
   isload = true;
 });

try {
  await Provider.of<AuthHelper>(context,listen: false).singin(user[0], user[1], context);
   Navigator.of(context).pushReplacement(MaterialPageRoute(
  builder: (_) => ThemeConsumer(child: Nav()),
),);
} on NoUserEx catch(e) {
showDialog(context: context, builder: (ctx){
return AlertDialog(
title: Text("LogIn failed"),
content: Text(e.toString()),
actions:<Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],

);
});

}on NoPassex catch(e){
showDialog(context: context, builder: (ctx){
return AlertDialog(
title: Text("LogIn failed"),
content: Text(e.toString()),
actions:<Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],

);
});

}
setState(() {
   isload = false;
 });
 

}


}


  @override
  Widget build(BuildContext context) {
    return 
      Container(
        height: 300.h,
        width: MediaQuery.of(context).size.width-50,
        child: Form(
          key: _form,
          
          
          child:Column(
           
          mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
           boxShadow: [
     BoxShadow(
color: Color.fromARGB(255, 79, 78, 78),
offset: Offset(0, 5),

blurRadius: 4,




     )


                    ],
  ),
  child:   TextFormField(
  
  decoration: InputDecoration(
      filled: true,

  fillColor: Colors.white,
  
  enabledBorder:  OutlineInputBorder(
  
                      borderRadius: BorderRadius.circular(50.r),
  
                      borderSide: BorderSide(
  
                        color: Theme.of(context).primaryColor,
  
                        width: 1.0,
  
                      ),
  
                    ),
  
                     border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius:BorderRadius.circular(50.r)),
  
    suffixIcon: Icon(Icons.email),
  
    label: Text("Email")),
  
    
  
  keyboardType: TextInputType.emailAddress,
  
  textInputAction: TextInputAction.next,
  
  
  
  validator: (val){
  
  if(val!.isEmpty){
  
    return "Enter Email";
  
  }
  
  if(!val.contains('@')||!val.contains('@')){
  
    return "Enter Valid Email";
  
  }
  
  return null;
  
  },
  
  onSaved: (val){
  
    user[0] = val!;
  
  },
  
  ),
),
Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
           boxShadow: [
     BoxShadow(
color: Color.fromARGB(255, 79, 78, 78),
offset: Offset(0, 5),

blurRadius: 4,




     )


                    ],
  ),
  child:   TextFormField(
  
    
  
  decoration: InputDecoration(
      filled: true,

  fillColor: Colors.white,
  
  enabledBorder:  OutlineInputBorder(
  
                      borderRadius: BorderRadius.circular(50.r),
  
                      borderSide: BorderSide(
  
                        color: Theme.of(context).primaryColor,
  
                        width: 1.0,
  
                      ),
  
                    ),
  
     suffixIcon: Icon(Icons.password),
  
    border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
  
    label: Text("Password")),
  
    
  
           obscureText: true,
  
  
  
  textInputAction: TextInputAction.done,
  
  
  
  validator: (val){
  
  if(val!.isEmpty){
  
    return "Enter Password";
  
  }
  
  return null;
  
  },
  
  onSaved: (val){
  
          user[1] = val!;
  
  },
  
  
  
  ),
),
 isload?CircularProgressIndicator() :InkWell(
                onTap: () {
               onSvaed();
                },
                child: Container(

                  padding: EdgeInsets.all(10.sp),
                
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
     BoxShadow(
color: Color.fromARGB(255, 79, 78, 78),
offset: Offset(0, 5),

blurRadius: 1,




     )


                    ],
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      color: Theme.of(context).primaryColor),
                  child: Text(
                    "log In",
                    style: TextStyle(color: Colors.white, fontSize: 30.sp),
                  ),
                ),
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
  children: [
Text("Dont Have Account?",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),

TextButton(
   style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
  onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Sign())));


  }, child: Text("Create One"))


  ],


              )
              






],




        )),
      );
    
    
  }
}