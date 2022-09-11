import 'package:flutter/cupertino.dart';

import '../models/order.dart';
import '../models/cart.dart';



class Orders extends ChangeNotifier {

List<OrderItem> items = [];

addtoOrders( double total ,List<CartItem> cartitems){
 final b =   OrderItem(id: DateTime.now().toString(), amount: total, products: cartitems, dateTime: DateTime.now());
items.add(b);
notifyListeners();
}

  
}