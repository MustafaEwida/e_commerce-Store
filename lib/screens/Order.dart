

import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/orderwidger.dart';
import 'package:provider/provider.dart';

import '../providers/Order.dart';
import '../models/order.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return  ListView.builder(
        itemCount: orderData.items.length,
        itemBuilder: (ctx, i) => OrderWidget(orderData.items[i]),
      );
    
  }
}
