import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Signform.dart';
class Sign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
 appBar: AppBar(title: Text("Sign In"),),
 body:  Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color.fromARGB(255, 244, 244, 242).withOpacity(0.5),
                  Color.fromARGB(255, 129, 196, 202).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
         
           Container(
              height: 1.sh,
              width: 1.sw,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     Container(
                        margin: EdgeInsets.only(bottom: 20.h,top: 80.h),
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 94.0.w),
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontFamily: 'Anton',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    
                     Signform(),
                    
                  ],
                ),
              ),
            ),
          
        ],
      ),

    );
    







    
  }
}