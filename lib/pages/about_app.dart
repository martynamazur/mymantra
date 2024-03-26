import 'package:flutter/material.dart';
import 'package:mymantra/pages/custom_style/primary_app_bar.dart';

import '../config/AppStrings.dart';
import 'custom_style/theme.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PrimaryAppBar(title: AppStrings.aboutApp),
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_icon.png',
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wersja: 1.0.0',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppStrings.abouAppDescription,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            //Drugi
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
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
