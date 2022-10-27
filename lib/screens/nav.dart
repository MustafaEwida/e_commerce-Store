import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/providers/provider.dart';
import 'package:provider/provider.dart';
import 'Overview.dart';
import 'favoraite.dart';
import 'cart.dart';
import 'Order.dart';
import '../widgets/drwer.dart';
class Nav extends StatefulWidget {
  

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool b = true;
  bool isload = false;
  int index = 0;
  List<Widget> x = [
Product_screen(),
CartScreen(),
OrdersScreen(),
Fav_screen(),
  ];
  

@override
  void didChangeDependencies() {
   
    if(b){
       setState(() {
      isload = true;
    });
    Provider.of<Main_Provider>(context,listen: false).fetchProducts().then((value) {
setState(() {
      isload = false;
});

    });
  }


  b =false;

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
    
      drawer: AppDrwer(),
  appBar: AppBar(
    actions: [
      IconButton(onPressed: (){
        FirebaseAuth.instance.signOut();
      }, icon: Icon(Icons.search))
    ],
  ),
  body:isload?const Center(child: CircularProgressIndicator(),): x[index],

bottomNavigationBar:BottomNavigationBar(
  backgroundColor: Theme.of(context).primaryColor,
  unselectedItemColor: Colors.white,
  selectedItemColor: Colors.amber,
  type: BottomNavigationBarType.fixed,
  onTap: (value) {
    setState(() {
      index=value;
    });
  },
  
  currentIndex: index,

   items:const [

BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Shop' ),
BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'Cart' ),
BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label:'Orders'),
BottomNavigationBarItem(icon: Icon(Icons.favorite),label:'favorite'),
]
),


    );
    
  }
}