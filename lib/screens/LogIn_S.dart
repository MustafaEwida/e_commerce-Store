

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/LogInform.dart';
class LogIn_Screen extends StatefulWidget {
 
  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {


  @override
  Widget build(BuildContext context) {
      final deviceSize = MediaQuery.of(context).size;
    return Scaffold(

body:  Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 140, 196, 197).withOpacity(0.5),
                  Color.fromARGB(255, 72, 167, 176).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 94.w),
                      transform: Matrix4.rotationZ(-8 * 3.14 / 180)
                        ..translate(-10.0),
                      // ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600.w ? 2 : 1,
                    child: Log_form()),
                  
                ],
              ),
            ),
          ),
        ],
      ),

    );
    
    
    
    
    
    
    
  }
}
    
