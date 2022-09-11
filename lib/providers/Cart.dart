import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/product.dart';
class Cart extends ChangeNotifier{
  Map<int,CartItem> Carts = {};

double get  totalAmount{
  double sum = 0;
 Carts.forEach((key, value) {
 double x = value.price*value.quantity;
  sum+=x;
}

);
return sum;


}
addtoCart(Product product)  {
  if(Carts.containsKey(product.id)){
Carts.update(product.id!, (v) {
  return CartItem(id: v.id, title: v.title, quantity: v.quantity+1, price: v.price,imgurl: v.imgurl);
});}else{
  
  Carts.putIfAbsent(product.id!, () {
  return CartItem(id: DateTime.now().toString(), title: product.title!, quantity: 1, price: product.price!,imgurl: product.image!);
  });
  print(Carts);
notifyListeners();
}




}
 clear(){
Carts = {};
notifyListeners();

}
 
}