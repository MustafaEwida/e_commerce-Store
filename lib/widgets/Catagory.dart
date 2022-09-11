

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import './Gernal_product_widget.dart';
class Category_Widget extends StatelessWidget {
  String Catagory;
 Category_Widget(this.Catagory);



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Main_Provider>(context);
    
    return  Scaffold(
 appBar: AppBar(title: Text(Catagory),),
 body: ListView.builder(
  itemCount: provider.Category_items.length,
  itemBuilder: (context,index){
return G_P_widget(provider.Category_items[index]);

  }),



    );
    
  }
}