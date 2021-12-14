import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> carouselData = [
  "assets/images/carousel_1.png",
  "assets/images/carousel_2.png",
  "assets/images/carousel_3.png",
  "assets/images/carousel_4.png",
  "assets/images/carousel_5.png",
];

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({Key? key}) : super(key: key);

  @override
  _SliderCarouselState createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: carouselData
              .map((item) => Center(
                child: Image.asset(
                  item,
                ),
              ))
              .toList(),
          options: CarouselOptions(
              height: 170,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              aspectRatio: 2,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselData.map((url) {
            int index = carouselData.indexOf(url);
            return Container(
              width: _currentIndex == index ? 30 : 8,
              height: 8,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: _currentIndex == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
