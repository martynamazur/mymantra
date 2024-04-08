import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:vibration/vibration.dart';

class ScreenshotManager {
  final ScreenshotController _screenshotController;

  ScreenshotManager(this._screenshotController);

  void _showPopup(BuildContext context, String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informacja'),
          content: Text(status),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
/*
  void saveImage(Uint8List imageBytes) async {
    final result = await ImageGallerySaver.saveImage(imageBytes);
    if (result['isSuccess']) {
      print('Image successfully saved to gallery!');
    } else {
      print('Error saving image: ${result['error']}');
    }
  }

 */

  Future<void> capturePicture(BuildContext context) async {
    final capturedImage = await _screenshotController.capture();
    if (capturedImage != null) {
      try {
        final result = await ImageGallerySaver.saveImage(
          capturedImage,
          quality: 100,
        );
        if (result['isSuccess']) {
          _showPopup(context, 'Saved to gallery');
          Vibration.vibrate();
        } else {
          _showPopup(context, 'Something went wrong');
        }
      } catch (e) {
        _showPopup(context, 'Something went wrong');
      }
    }
  }
}
