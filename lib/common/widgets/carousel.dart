//import 'package:carousel_slider/carousel_options.dart';
// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        'https://spn-sta.spinny.com/blog/20231103174129/new-Tata-Harrier-1160x653.webp?compress=true&quality=80&w=1200&dpr=2.6',
        'https://www.revv.co.in/blogs/wp-content/uploads/2021/05/small-second-hand-cars-in-India-1280x720.jpg',
        'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FyfGVufDB8fDB8fHww'
        // Add more image URLs as needed, separated by commas
      ].map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200, // Adjust the height of the carousel slider
        autoPlay: true,
        aspectRatio: 16 / 9, // Adjust the aspect ratio of the images
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
