
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/Cart.dart';
import '../providers/Order.dart';
import '../widgets/cartitem.dart';
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return
      Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15.sp),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton( cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: cart.Carts.length,
              itemBuilder: (ctx, i) => CartWedgit(
                   cartItem: cart.Carts.values.toList()[i],
                  ),
            ),
          )
        ],
      );
    
  }
}

class OrderButton extends StatefulWidget {
  
   

  final Cart cart;
  OrderButton(this.cart);

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed:(widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addtoOrders(

                widget.cart.totalAmount,
                widget.cart.Carts.values.toList(),
                
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
      textColor: Theme.of(context).primaryColor,
    );
  }
}
