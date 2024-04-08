import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareContentManager {
  final ScreenshotController _screenshotController;

  ShareContentManager(this._screenshotController);

  void onShareXFileFromScreenshot(BuildContext context) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      final capturedImage = await _screenshotController.capture();

      if (capturedImage != null) {
        final tempDir = await getTemporaryDirectory();
        final screenshotFile = File('${tempDir.path}/screenshot.png');
        await screenshotFile.writeAsBytes(capturedImage);

        final shareResult = await Share.shareFiles(
          [screenshotFile.path],
          text: 'Check out my screenshot!',
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );

        //scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
      } else {
        print('Failed to capture image.');
      }
    } catch (e) {
      print('Error capturing or sharing image: $e');
    }
  }
}
