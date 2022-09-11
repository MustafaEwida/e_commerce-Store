import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './productitem.dart';
import '../providers/provider.dart';
class ProductsGrid extends StatelessWidget {
 



  @override
  Widget build(BuildContext context) {
    final main = Provider.of<Main_Provider>(context);
    final products = main.items;
    return GridView.builder(
      padding:  EdgeInsets.all(10.0.sp),
      itemCount: products.length,
      itemBuilder:(context,i) =>item(
              products[i]
                ),
          
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.w,
      ),
    );
  }
}