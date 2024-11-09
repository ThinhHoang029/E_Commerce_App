import 'package:carousel_slider/carousel_slider.dart';
import 'package:commerce_flutter_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true, // Bật tính năng tự động phát
        autoPlayInterval:
            const Duration(seconds: 3), // Thời gian giữa các slide
        autoPlayAnimationDuration: const Duration(
            milliseconds: 800), // Thời gian cho hoạt ảnh chuyển đổi
        autoPlayCurve: Curves.easeInOut, // Hiệu ứng chuyển đổi
      ),
    );
  }
}
