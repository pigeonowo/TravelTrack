import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.child,
  });

  final String imagePath;
  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: .fill),
      ),
      child: child,
    );
  }
}
