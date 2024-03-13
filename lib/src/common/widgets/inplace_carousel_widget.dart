import 'package:bato_mechanic/src/utils/extensions/build_context_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';

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
                    width: AppWidth.h8,
                    height: AppWidth.h8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (context.isDarkMode
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
