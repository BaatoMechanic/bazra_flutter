import 'package:flutter/material.dart';

class DebugBanner extends StatelessWidget {
  const DebugBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Debug Banner'),
        ),
        body: const Center(
          child: Banner(
            message: 'DEBUG',
            location: BannerLocation.topEnd,
            color: Colors.red,
            textStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
