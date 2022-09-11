import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
class Carousal extends StatefulWidget {

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
   int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
  final a =  Provider.of<Main_Provider>(context).items.map((e) {
      return  e.image;

  }).toList();  

    return Column(children: [
Container(
 
  padding: EdgeInsets.all(10.sp),
        child: CarouselSlider(

       carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          
          items:  a.map((e) {
            return 
       
           
                Container(
                  width: double.infinity,
                  child: Image.network(e!,));
              
              
              
              
          }).toList(),
        ),
      )
      ,   Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: a.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0.w,
                height: 10.0.h,
                margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 2.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),






    ],);
  }
}