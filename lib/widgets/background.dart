import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/blue.png",
              width: size.width * 0.25,
              height: size.height * 1.32,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/blue.png",
              width: size.width * 0.25,
              height: size.height * 1.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
