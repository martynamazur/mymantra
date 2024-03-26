import 'package:flutter/material.dart';

class StackedShadowContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double width;
  final double height;

  const StackedShadowContainer({
    Key? key,
    required this.child,
    required this.backgroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, -1),
                    blurRadius: 3,
                    color: Color(0xFFFFFFFF).withOpacity(0.7),
                  ),
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Color(0xFFFFFFFF).withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, -1),
                    blurRadius: 3,
                    spreadRadius: 0,
                    color: Color(0xAEAEC0).withOpacity(0.4),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-1, -1),
                      blurRadius: 3,
                      color: Color(0xFFFFFFFF).withOpacity(0.7),
                    ),
                    BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Color(0xFFFFFFFF).withOpacity(0.7),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
