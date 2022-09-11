import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/Cart.dart';
import '../models/product.dart';
import '../providers/provider.dart';
class G_P_widget extends StatelessWidget {
  Product product;
  G_P_widget(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
elevation: 8,
child: Column(
children: [
Container(
  width: double.infinity,
  height: 250.h,
  child: Image.network(product.image!),
)
,ListTile(
leading:  IconButton(
                  icon: Icon(
                    color: Theme.of(context).primaryColor,
                    product.isfavo? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                   Provider.of<Main_Provider>(context,listen: false).changefavo(product);
                  },
                ) ,
title: FittedBox(child: Text(product.title!)),
trailing:IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(
                color: Theme.of(context).primaryColor,
              Icons.shopping_cart,
            ),
            onPressed: () {
               Provider.of<Cart>(context,listen: false).addtoCart(product);
                 Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart!',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                    
                    },
                  )));
        
            },
            color: Theme.of(context).accentColor,
          ) ,
)



],




),






    );
  }
}