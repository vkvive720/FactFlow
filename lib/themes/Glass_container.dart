import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Glass_container extends StatelessWidget {


  const Glass_container(
      {Key? key,
        required this.theWidth,
        required this.theHeight,
        required this.theChild})
      : super(key: key);
  final theWidth;
  final theHeight;
  final theChild;


  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(

        width: theWidth,
        height: theHeight,
        borderRadius:15.0,
        blur: 80.0,
        // alignment: alignment,
        border:.2,
        linearGradient:linier_gradient ,
        borderGradient:border_gradient ,
        child: theChild);
  }
}

LinearGradient linier_gradient =LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6f747c).withOpacity(0.1),
      Color(0xFFFFFFFF).withOpacity(0.05),
    ],
    stops: [
      0.1,
      1,
    ]);

LinearGradient border_gradient=LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF1e1f22).withOpacity(0.5),
    Color((0xFF1e1f22)).withOpacity(0.5),
  ],
);


