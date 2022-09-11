import 'package:flutter/material.dart';

class RouteHelper<T> extends MaterialPageRoute<T> {
  RouteHelper(WidgetBuilder wb,RouteSettings settingis):super(builder: wb,settings: settingis);




  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
   return FadeTransition(opacity: animation,child: child,);
  }
}
class transtionBuilder extends PageTransitionsBuilder{
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
    {
   late final Animation<double> _animation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );


  return ScaleTransition(
    
    scale:_animation,
    child: child,
  );
    /*return FadeTransition(opacity: animation ,child: child,);*/
  }
  
}