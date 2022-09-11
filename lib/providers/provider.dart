import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/models/User.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import 'package:http/http.dart';
import 'Auth.dart';
class Main_Provider extends ChangeNotifier {
 Main_Provider(this._item,this.Cato);
  List<Product> _item =[];
List Cato =[];
List<Product> get items{
return [..._item];

}
  List<Product> favorate =[];
 List<Product> Category_items =[];








Future<void>  fetchProducts() async{
  
  var url = Uri.parse('https://fakestoreapi.com/products');
  final respons = await get(url);
  final List products = json.decode(respons.body) ;
final a=    products.map((e) {

return  Product(
  id: e['id'],
  title:e['title'],
  category:e['category'],
  rating: Rating.fromJson(e['rating'] as Map<String,dynamic>),
  description: e['description'],
  image: e['image'],
  price: double.parse(e['price'].toString())  );

},).toList();
_item=a;
url = Uri.parse('https://fakestoreapi.com/products/categories');
 final secondrespons = await get(url);
  final  category = json.decode(secondrespons.body)  ;

  
Cato=category;




notifyListeners();
}
Future<void>  fetchcategories() async{
  
  final url = Uri.parse('https://fakestoreapi.com/products/categories');
 final respons = await get(url);
  final List<String> category = json.decode(respons.body) ;
  print(Cato);
Cato=category;

notifyListeners();
}
  /*sginup(String email, String password,BuildContext ctx,UserMdoel user)async{
    print("hello");
 await   AuthHelper.authHelper.singup(email, password,ctx,user);
    notifyListeners();
  } */
  /**sginin(String emailAddress, String password, BuildContext context)async{
    print("hello");
 await   AuthHelper.authHelper.singin(emailAddress, password, context);
    notifyListeners();
  }*/

  fillfavo(){

  favorate = _item.where((element) => element.isfavo==true).toList(); 
  
   notifyListeners();
  }

  changefavo(Product product){
  int index = _item.indexWhere((element) => element.id==product.id);
  _item[index].isfavo = !_item[index].isfavo ;
 
  fillfavo();


  }


 filltercategory(String category) {
   Category_items = items.where((element){
  return element.category==category;
   }).toList();
  notifyListeners();
 }
}
