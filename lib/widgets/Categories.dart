import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import './Catagory.dart';
import '../providers/provider.dart';

class Category_widget extends StatelessWidget {
 
 int v = 0;
List<Icon> bb = [
Icon(Icons.laptop),
Icon(Icons.laptop),
Icon(Icons.laptop),
Icon(Icons.add),
];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Main_Provider>(context); 
    final cato = provider.Cato;
   final List category =[
 [cato[0],Icon(Icons.show_chart_sharp,color: Theme.of(context).primaryColor,)],
 [cato[1],Icon(Icons.shop,color: Theme.of(context).primaryColor,)],
 [cato[2],Icon(Icons.man_rounded,color: Theme.of(context).primaryColor,)],
 [cato[3],Icon(Icons.girl_sharp,color: Theme.of(context).primaryColor,)],
    ];

    
    return Column(
   crossAxisAlignment: CrossAxisAlignment.start ,
children: [
Text("Categories"),
 SingleChildScrollView(
  scrollDirection: Axis.horizontal,
   child: Row(
   
 children: category.map((e) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
     child: Column(children: [
       
     Container(
      decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(30.r),
     border: Border.all(color: Theme.of(context).primaryColor,width: 1.w)

      ),
      margin: EdgeInsets.only(bottom: 5.h),
       child: InkWell(
        onTap: () {
         provider.filltercategory(e[0]);
         Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>Category_Widget(e[0]) )));
        },
         child: CircleAvatar(
           
           backgroundColor: Colors.transparent,
            radius: 30.r,child: Padding(
           padding: EdgeInsets.all(4.sp),
           
           
           child: e[1],
          ),),
       ),
     ),
 Text(e[0])
 
 
     ]),
    );

 }).toList(),),
 )








],



  );

 

       
      
    
  }
}