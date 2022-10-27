import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

return Scaffold(
  appBar: AppBar(title: Text("Chekout and order"),),
  body:   Column(children: [
  
  Container(
  padding: EdgeInsets.all(20),
  child: Column(
  children: [
    Text("your Card Informations",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
   Container(
                margin: EdgeInsets.only(top: 20),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w,
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Card Number")),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Password";
                    }

                    return null;
                  },
                  onSaved: (val) {
                   
                  },
                ),
                
              ),
                 Container(
                margin: EdgeInsets.only(top: 20),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w,
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Card Ica")),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Password";
                    }

                    return null;
                  },
                  onSaved: (val) {
                   
                  },
                ),
                
              ),
              InkWell(
                      onTap: () {
                    
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 79, 78, 78),
                                offset: Offset(0, 5),
                                blurRadius: 1,
                              )
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                            color: Theme.of(context).primaryColor),
                        child: Text(
                          "Check card Information ",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
  ],
    
  
  ),
  
  
  
  ),
   Container(
  padding: EdgeInsets.all(20),
  child: Column(
  children: [
    Text("your Informations",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
   Container(
                margin: EdgeInsets.only(top: 20),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w,
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Address")),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Password";
                    }

                    return null;
                  },
                  onSaved: (val) {
                   
                  },
                ),
                
              ),
               Container(
                margin: EdgeInsets.only(top: 20),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w,
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Your Zip")),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Password";
                    }

                    return null;
                  },
                  onSaved: (val) {
                   
                  },
                ),
                
              ),
                 Container(
                margin: EdgeInsets.only(top: 20),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w,
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50.r)),
                      label: Text("Phone Number")),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Password";
                    }

                    return null;
                  },
                  onSaved: (val) {
                   
                  },
                ),
                
              ),
              InkWell(
                      onTap: () {
                    
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 79, 78, 78),
                                offset: Offset(0, 5),
                                blurRadius: 1,
                              )
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                            color: Theme.of(context).primaryColor),
                        child: Text(
                          "Bill and charge",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
  ],
    
  
  ),
  
  
  
  )
  
  
  
  
  
  
  
  
  
  ],),
);
  }
  
}