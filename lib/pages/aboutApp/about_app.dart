import 'package:flutter/material.dart';

import '../../config/AppStrings.dart';
import '../../config/custom_style/primary_app_bar.dart';
import '../../config/custom_style/theme.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const PrimaryAppBar(title: AppStrings.aboutApp),
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_icon.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Wersja: 1.0.0',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AppStrings.abouAppDescription,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            //Drugi
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(AppStrings.aboutAppPrivacyQuestion),
                  SizedBox(height: 20),
                  Text(
                    AppStrings.aboutAppPrivacyAnwser,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Divider(height: 2),
                  Text(AppStrings.aboutAppPrivacyDescription),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
