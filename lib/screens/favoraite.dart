import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../widgets/Gernal_product_widget.dart';
class Fav_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  final provider=  Provider.of<Main_Provider>(context);
    return ListView.builder(
      itemCount: provider.favorate.length,
      
      itemBuilder:(context,i){
        return G_P_widget(provider.favorate[i]);
      } );
    
  }
}