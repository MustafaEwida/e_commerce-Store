import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/providers/Cart.dart';
import 'package:flutter_application_3/providers/provider.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import './detialpage.dart';
class item extends StatelessWidget {
  Product product;
  item(this.product);
 

  @override
  Widget build(BuildContext context) {
   
    return  Consumer<Main_Provider>(builder: (x,provider,z){
return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>Detail_widget(product) )));
          },
          child:Hero(
            tag: product.id!,
            child: 
            FadeInImage(placeholder: NetworkImage("https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png"), 
            image: NetworkImage(product.image!)),
          ),)
      ,  footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text("         "),
          leading: 
            IconButton(
                  icon: Icon(
                    color: Theme.of(context).primaryColor,
                    product.isfavo? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                   Provider.of<Main_Provider>(context,listen: false).changefavo(product);
                  },
                ),
          
          trailing: IconButton(
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
                
            /*  cart.addItem(product.id, product.price, product.title);
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
                  ),
                ),
              );*/
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );


    });
  }
}