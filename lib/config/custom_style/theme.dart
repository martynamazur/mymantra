import 'package:flutter/material.dart';

class AppDecoration {

  static final BoxDecoration transparentBackground = BoxDecoration(
    color: Colors.transparent.withOpacity(0.1),
    borderRadius: BorderRadius.circular(5.0),
  );


  static final BoxDecoration neumorphicBackground = BoxDecoration(
    color: Color(0xFFF0F0F3),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        offset: Offset(-1, -1), // Przesunięcie cienia w lewo i w górę
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xFFFFFFFF).withOpacity(1), // Kolor pierwszej warstwy cienia
      ),
      BoxShadow(
        offset: Offset(1.5, 1.5), // Przesunięcie cienia w prawo i w dół
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xFFAEAEC0).withOpacity(0.4), // Kolor drugiej warstwy cienia
      ),
    ],
  );

  static final BoxDecoration neomorphicButton = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(
        offset: Offset(-1,-1),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xFFFFFFFF).withOpacity(1),
      ),
      BoxShadow(
        offset: Offset(1.5,1.5),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xAEAEC0).withOpacity(0.4),
      ),
    ],
  );

  static final BoxDecoration innerNeomorphicButton = BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 1,
        spreadRadius: 0,
        color: Color(0xAEAEC0).withOpacity(0.15),
      ),
      BoxShadow(
        offset: Offset(-1, -1),
        blurRadius: 1,
        spreadRadius: 0,
        color: Colors.white.withOpacity(0.7),
      ),
    ],
  );

  static final BoxDecoration circleCheckBox = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.grey[200],
    boxShadow: [
      BoxShadow(
        offset: Offset(-4,-4),
        blurRadius: 9,
        color: Colors.white.withOpacity(0.6),
      ),
      BoxShadow(
        offset: Offset(4,4),
        blurRadius: 14,
        spreadRadius: 0,
        color: Color(0xE3E3E3).withOpacity(1.0),
      ),
    ],

  );

  static final BoxDecoration pressedStyle = BoxDecoration(
    color: Colors.grey[200], // Kolor głównego tła
    borderRadius: BorderRadius.circular(5.0),
    boxShadow:[
      BoxShadow(
      offset: Offset(-1, -1), // Przesunięcie cienia w lewo i w górę
      blurRadius: 3,
      spreadRadius: 0,
      color: Color(0xFFFFFFFF).withOpacity(1), // Kolor pierwszej warstwy cienia
    ),
      BoxShadow(
        offset: Offset(1.5, 1.5), // Przesunięcie cienia w prawo i w dół
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xAEAEC0).withOpacity(0.4), // Kolor drugiej warstwy cienia
      ),
    ]

  );
  static final BoxDecoration innerDoubleShadowPressed = BoxDecoration(
    color: Color(0xEEEEEE), // Kolor głównego tła
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(
        offset: Offset(-1, -1),
        blurRadius: 3,
        color: Color(0xFFFFFFFF).withOpacity(0.7), // Pierwszy cień wewnętrzny
      ),
      BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 3,
        color: Color(0xFFFFFFFF).withOpacity(0.15), // Drugi cień wewnętrzny
      ),
      BoxShadow(
        offset: Offset(-1, -1),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color(0xAEAEC0).withOpacity(0.4), // Zewnętrzny cień
      ),
    ],
  );

}
