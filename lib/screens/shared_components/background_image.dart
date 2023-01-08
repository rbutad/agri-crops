import 'package:flutter/material.dart';

class BackgroundImageComponent extends StatelessWidget {
  final double heightMultiplier;

  const BackgroundImageComponent({Key? key, this.heightMultiplier = 0.35})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Image(
      image: const AssetImage('assets/images/realfruits.png'),
      height: size.height * heightMultiplier,
      fit: BoxFit.cover,
    );
  }
}
