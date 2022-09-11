import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/Cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/provider.dart';

class Detail_widget extends StatelessWidget {
  Product product;
  Detail_widget(this.product);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Main_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: 250.h,
                padding: EdgeInsets.all(10.sp),
              ),
              Positioned(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)),
                        color: Colors.white,
                        boxShadow: [BoxShadow()]),
                    padding: EdgeInsets.all(10.sp),
                    child: Hero(
                      tag: product.id!,
                      child: Image.network(product.image!))),
                left: 0,
                width: 300.w,
                height: 200.h,
                top: 30.h,
              ),
              Positioned(
                top: 50.h,
                right: 20.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor, blurRadius: 3),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Provider.of<Main_Provider>(context, listen: false)
                          .changefavo(product);
                    },
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.white,
                      child: product.isfavo
                          ? Icon(Icons.favorite,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.favorite_outline,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r)),
                    color: Colors.white,
                  ),
                  child: Text("\$${product.price}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                top: 160.h,
                right: 0,
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      border: Border.all(
                          width: 1.w, color: Theme.of(context).primaryColor)),
                  child: Text(
                    product.category!,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      border: Border.all(
                          width: 1.w, color: Theme.of(context).primaryColor)),
                  child: Text(
                    'Rating:  ${product.rating!.rate}',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold)),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.w))),
                    margin: EdgeInsets.only(top: 10.h),
                    height: 250.h,
                    padding: EdgeInsets.all(10.sp),
                    child: SingleChildScrollView(
                        child: Text(
                      product.description!,
                      style: TextStyle(fontSize: 15.sp, height: 1.5.h),
                    )))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<Cart>(context, listen: false).addtoCart(product);
            },
            child: Container(
              padding: EdgeInsets.all(5.sp),
              width: 1.sw - 20.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  border: Border.all(
                      width: 1.w, color: Theme.of(context).primaryColor),
                  color: Theme.of(context).primaryColor),
              child: Text(
                "Add To Cart",
                style: TextStyle(color: Colors.white, fontSize: 30.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
