
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/Cart.dart';
import '../models/cart.dart';
class CartWedgit extends StatelessWidget {
    CartItem cartItem;
  CartWedgit(
  {
    required this.cartItem
  }
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.sp,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        margin: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 4.h,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text(
                  'Do you want to remove the item from the cart?',
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                ],
              ),
        );
      },
      onDismissed: (direction) {
     //   Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        elevation: 7,
        margin: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 4.w,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 30.r,
              backgroundImage:  NetworkImage(cartItem.imgurl,),
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: FittedBox(
                  child: Text('\$$cartItem.price'),
                ),
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Text('Total: \$${(cartItem.price * cartItem.quantity)}')),
            trailing: Text('${cartItem.quantity} x'),
          ),
        ),
      ),
    );
  }
}
