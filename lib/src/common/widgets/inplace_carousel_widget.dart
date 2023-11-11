// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';

import '../../utils/constants/managers/color_manager.dart';

class InPlaceCarouselWidget extends StatefulWidget {
  const InPlaceCarouselWidget({
    Key? key,
    required this.items,
    this.showIndicator = false,
    this.aspectRatio = 16 / 9,
    this.autoPlayInterval = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }

  final List<Widget> items;
  final bool showIndicator;
  final double aspectRatio;
  final Duration autoPlayInterval;
}

class _CarouselWithIndicatorState extends State<InPlaceCarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // final List<Widget> tipSliders = widget.items.map((item) => item).toList();
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            items: widget.items,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: widget.autoPlayInterval,
              viewportFraction: 1.0.doubleHardcoded(),
              aspectRatio: widget.aspectRatio,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          if (widget.showIndicator)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
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
        ],
      ),
    );
  }
}
