import 'package:bato_mechanic/src/utils/helpers/user_helper.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget loadingInidicator(BuildContext context, {double? radius}) {
    return Center(
        child: SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    ));
  }

  static Widget renderImage(String image,
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
}
