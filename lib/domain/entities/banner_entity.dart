import 'package:flutter/cupertino.dart';

class BannerEntity {
  String image;

  String title;

  String slogan;
  Alignment alignment;
  Color buttonBackGroundColor;
  Color buttonForGroundColor;

  BannerEntity({
    required this.image,
    required this.title,
    required this.slogan,
    required this.alignment,
    required this.buttonBackGroundColor,
    required this.buttonForGroundColor
  });

}