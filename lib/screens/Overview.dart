import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/models/product.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../widgets/caro.dart';
import '../widgets/Categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/productsgrid.dart';
class Product_screen extends StatelessWidget {
  


    
  @override
  Widget build(BuildContext context) {


    return  
  
 ListView(
      children: [
      Carousal(),
      Category_widget(),
    Container(
      height: 400,
      
      child: ProductsGrid())
      ],
     ) ;
   
 
 
 
 
 
 
 /* Container(
  color: Colors.white54,
  padding: EdgeInsets.all(10),
        child: CarouselSlider(

          options: CarouselOptions(
             aspectRatio: 1.5,
            autoPlay: true,
            
            enlargeCenterPage: true,
          ),
          items:  imgList.map((e) {
            return 
       
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Image.network(e,fit: BoxFit.cover,));
              
              
              
              
          }).toList(),
        ),
      ),*/
 
 
 
 
 /*FutureBuilder(
   future:Provider.of<Main_Provider>(context,listen: false).fetchProducts() ,

   builder: (context, sn ) {
     return Consumer<Main_Provider>(builder: (x,y,z){
return ListView.builder(itemCount: y.items.length,
itemBuilder: (ctx,i){
return ListTile(title:Text(y.items[i].title! ),);
});


     })  ;
   },
 ),*/






    
    
  }
}