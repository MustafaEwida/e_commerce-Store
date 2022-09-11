import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/Auth.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthHelper>(context).userAuth;
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Profile"),
        ),
        body: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(children: [
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 1.3,
                    color: Theme.of(context).primaryColor,
                  ),
                  Positioned(
                    top: constraints.maxHeight / 1.9,
                    right: constraints.maxWidth / 2 - 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 55.r,
                      child: Icon(size: 60.sp, Icons.person, color: Colors.white),
                    ),
                  ),
                ]);
              },
            ),
          ),
          Expanded(
              child: Padding(
                padding:  EdgeInsets.all(20.sp),
                child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                TextFormField(
                  readOnly: true,
                    initialValue: user!.name,
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.w,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        label: Text("YourName"))),
                         TextFormField(
                  readOnly: true,
                    initialValue: user.phoneNumber.toString(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.w,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        label: Text("Number"))),
                           TextFormField(
                  readOnly: true,
                    initialValue: user.email,
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0.w,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        label: Text("Email")))
                        ,   TextFormField(
                  readOnly: true,
                    initialValue: user.gender,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0.w,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        label: Text("Gender")))
                          , TextFormField(
                  readOnly: true,
                    initialValue: DateFormat.yMMMd().format(user.birth!),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.0.w,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        label: Text("birthDate"))),

  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                    
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor,width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                         ),
                      child: Text(
                        "Upadte Profile",
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.sp),
                      ),
                    ),
                  )

            ],
          )),
              ))
        ]));
  }
}
/* Form(
  
    child:   Column(
  
    
  
      children: [
  
    TextFormField(
  
  initialValue: "jjjjjj",
  
  
  
     decoration: InputDecoration(
  
                
  
                enabledBorder:  OutlineInputBorder(
  
                
  
                            borderRadius: BorderRadius.circular(25.0),
  
                
  
                            borderSide: BorderSide(
  
                
  
                              color: Theme.of(context).primaryColor,
  
                
  
                              width: 1.0,
  
                
  
                            ),
  
                
  
                          ),
  
                
  
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  
                
  
                  label: Text("Password"))
  
  
  
  
  
  ),
  
  
  
  
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
      ],
  
    
  
    ),
  
  )*/ 