
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Settings_Group extends StatelessWidget {
  Settings_Group({required this.title, required this.settingsItems});
  String title;
List<Widget> settingsItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      
     
      
      padding: EdgeInsets.all(15.sp),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: EdgeInsets.only(bottom: 10.h,left: 10.h),
        child: Text(title,style: TextStyle(fontSize: 20.sp,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500),),
      ),
    Container(
      
      child:  ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox();
              },
              itemCount: settingsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return settingsItems[index];
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
            ),)



        ],
      ),
      
    );
  }
}