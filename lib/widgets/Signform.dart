import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/Auth.dart';
import 'package:flutter_application_3/expction/emailexistex.dart';
import 'package:flutter_application_3/providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import '../models/User.dart';
import '../screens/nav.dart';
import '../helper/navkey.dart';
class Signform extends StatefulWidget {
  @override
  State<Signform> createState() => _SignformState();
}

class _SignformState extends State<Signform> {
 GlobalKey<FormState> form = GlobalKey();
 TextEditingController passcontrol = TextEditingController();
  UserMdoel user = UserMdoel(
      password: null,
      birth: null,
      email: null,
      gender: null,
      id: null,
      name: null,
      phoneNumber: null);

  void onSvaed() async{
    if (form.currentState!.validate()) {
      form.currentState!.save();

   try {
      await  Provider.of<AuthHelper>(context, listen: false)
          .singup(user.email!, user.password!, context, user);
           Custum_Nav.navigatorKey.currentState!.push((MaterialPageRoute(
  builder: (_) => ThemeConsumer(child: Nav()),
)));
   }on useremailEx catch (e) {
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
    }
  }

  showdate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        user.birth = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: form,
        child: Container(
         
          width: 1.sw - 70.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.w,
                      ),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
                    label: Text("Enter Your Name")),
                keyboardType: TextInputType.text,
                
                textInputAction: TextInputAction.next,
               validator: (val){
                if(val!.isEmpty){
                  return "Enter Name";
                }
              return null;
               },
                onSaved: (val) {
                user.name=val;
                },
              ), //.........................................................................................................
            
              
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10.h),
                 child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.w,
                          ),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
                        label: Text("Enter your Phone")),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Number";
                      }

                      if (int.tryParse(val) == false) {
                        return "Enter Valid Number Not Text";
                      }

                      if (int.parse(val) <= 0) {
                        return "Enter Valid Number";
                      }

                      return null;
                    },
                    onSaved: (val) {
                   
                       user.phoneNumber =int.parse(val!);
                    },
                  ),
               ),
              

              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.w,
                      ),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
                    label: Text("Email")),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Email";
                  }
                  if (!val.contains('@') || !val.contains('@')) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
                onSaved: (val) {
                 user.email=val;
                },
              ),
              
              
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextFormField(
                    controller: passcontrol,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.w,
                          ),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
                        label: Text("Password")),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.done,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Password";
                      }

                      return null;
                    },
                    onSaved: (val) {
                    user.password=val;
                    },
                  ),
                ),
              
             TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide(width: 1.w,color:Theme.of(context).primaryColor ),borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Conform Password")),
                  obscureText: true,
                
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Conform password";
                    }if(val!=passcontrol.text){
                      return "password didnt match";
                    }

                    return null;
                  },
                
                )
             , Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  user.birth == null
                      ? Text("Choose birthDay")
                      : Text(DateFormat.yMMMd().format(user.birth!)),
                  TextButton(
                      onPressed: () {
                        showdate();
                      },
                      child: Text("Choose"))
                ],
              ),
              Row(children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<String>(
                      title: Text("male"),
                      value: 'MALE',
                      groupValue: user.gender,
                      onChanged: (value) {
                        setState(() {
                          user.gender = value;
                        });
                      }),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<String>(
                      title: Text("female"),
                      value: 'female',
                      groupValue: user.gender,
                      onChanged: (value) {
                        setState(() {
                          user.gender = value;
                        });
                      }),
                ),
              ]),
              InkWell(
                onTap: (){
                  onSvaed();
                },
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  ),
                  child: Text(
                    "log In",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 30.sp),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
