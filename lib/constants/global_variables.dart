import 'package:flutter/material.dart';

String uri = 'http://192.168.100.7:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 201, 118, 29),
      Color.fromARGB(255, 223, 126, 16),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 230, 133, 6)!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://thanhnien.mediacdn.vn/Uploaded/nthanhluan/2022_12_07/sp-2355.png',
    'https://dealngon24h.com/wp-content/uploads/2021/09/khuyen-mai-mung-sinh-nhat-shopee-1.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.png',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpg',
    },
  ];
}
