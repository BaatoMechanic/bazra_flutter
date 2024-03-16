import 'package:flutter/material.dart';

import '../utils/helpers/user_helper.dart';

Widget ImageWidget(String image,
    {double? height, double? width, isNetwork = true}) {
  if (isNetwork) {
    if (!image.contains('http')) {
      image = UserHelperFunctions.getProfileImageUrl(image);
    }
    if (image.contains('https://') || image.contains('http://')) {
      return Image.network(
        image,
        height: height,
        width: width,
      );
    }
  }
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.fill,
  );
}
