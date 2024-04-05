import 'package:flutter/material.dart';

class HeartBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Background'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red, // Kolor tła (czerwony kwadrat)
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.white, size: 48), // Ikona w kształcie serca
              onPressed: () {
                // Dodaj logikę obsługi kliknięcia ikony serca tutaj
              },
            ),
          ),
          Center(
            child: Text(
              'Your Content Here',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HeartBackground(),
  ));
}

