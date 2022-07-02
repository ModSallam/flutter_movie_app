import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String image;
  final Function() onTap;

  const ImageContainer({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.radius = 30,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
