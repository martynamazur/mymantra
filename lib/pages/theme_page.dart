import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/theme_model.dart';
import 'package:mymantra/pages/custom_style/my_custom_appbar.dart';
import 'package:mymantra/pages/custom_style/theme.dart';
import 'package:mymantra/providers/providers.dart';

import '../models/background_model.dart';
import 'custom_style/primary_app_bar.dart';

class ThemeScreen extends ConsumerWidget {
  ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModel = ref.watch(themeProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Column(
              children: [
                PrimaryAppBar(title: 'Theme'),
                SizedBox(height: 24),
                _buildThemeSwitch(themeModel: themeModel, ref: ref),
                SizedBox(height: 24),
                Container(
                  decoration: AppDecoration.neumorphicBackground,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Background', style: TextStyle(fontSize: 16)),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 32,
                        crossAxisSpacing: 8,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: themeModel.backgrounds
                            .map((background) => _buildImageContainer(background, ref,  themeModel))
                            .toList(),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      )


    );
  }

  Widget _buildThemeSwitch({required ThemeModel themeModel, required WidgetRef ref}) {
    return Container(
      decoration: AppDecoration.neumorphicBackground,
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Day'),
          Switch(
            value: themeModel.isDarkModeOn,
            onChanged: (value) {
              ref.read(themeProvider).updateDarkMode();
            },
          ),
          const Text('Night'),
        ],
      ),
    );
  }

  Widget _buildImageContainer(Background background, WidgetRef ref,  ThemeModel themeModel) {

    return GestureDetector(
      onTap: () {
        ref.read(themeProvider).updateBackgroundChoice(background.backgroundId, background.path);
      },

      child: Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(background.path),
            fit: BoxFit.cover, // Ensure the image covers the entire container
          ),
          border: Border.all(
            color: background.backgroundId == themeModel.backgroundChoice ? Colors.green : Colors.transparent,
// Apply green border when selected
            width: 8.0, // Border width
          ),
        ),
        constraints: BoxConstraints(maxWidth: 150, maxHeight: 150),
      ),
    );
  }

}
