import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';



class OrderWidget extends StatefulWidget {
  final OrderItem order;

 OrderWidget(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expanded?widget.order.products.length * 60.0.h + 120.h:100.h,
      child: Card(
        margin: EdgeInsets.all(10.sp),
        elevation: 8,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
           
             AnimatedContainer(
              duration: Duration(milliseconds: 300),

                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                height: _expanded?widget.order.products.length * 60.0.h + 10.h:0,
                child: ListView(
                  children: widget.order.products
                      .map(
                        (prod) => Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: NetworkImage(prod.imgurl),
                                  ),
                                  Text(
                                    '${prod.quantity}x \$${prod.price}',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                        ),
                      )
                      .toList(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
