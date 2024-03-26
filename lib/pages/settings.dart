import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/settings_model.dart';
import 'package:mymantra/pages/custom_style/custom_switch.dart';
import 'package:mymantra/pages/custom_style/primary_app_bar.dart';

import '../config/AppStrings.dart';
import 'custom_style/my_custom_appbar.dart';
import 'custom_style/theme.dart';
import '../providers/providers.dart';


class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsModel = ref.watch(settingsModelProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryAppBar(title: AppStrings.settings),
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                          AppStrings.settingAutoScroll,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400 )
                      ),

                      Switch(
                        value: settingsModel.autoscroll,
                        onChanged: (newValue) {
                          ref.read(settingsModelProvider).updateAutoscroll();
                        },
                      ),

                    ],
                  )

                ],
              ),
            ),// Autoscorll
            Container(
              decoration: AppDecoration.neumorphicBackground,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderSwitch(
                          voiceAssistant: settingsModel.voiceAssistant,
                          onChanged: (newValue ){
                            ref.read(settingsModelProvider).updateVoiceAssistant();
                          })
                    ],
                  )
                ],
              ),
            ),// Voice Assistant,
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 32, // Ustaw połowę szerokości ekranu minus marginesy
                    decoration: AppDecoration.neumorphicBackground,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(AppStrings.settingTextSizeHeadline,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: settingsModel.textSize,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateTextSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingTextSize16,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: settingsModel.textSize,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateTextSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingTextSize20,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: settingsModel.textSize,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateTextSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingTextSize24,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // Odstęp między grupami
                  // Drugi layout z radiobuttonami dla grupy B
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 32, // Ustaw połowę szerokości ekranu minus marginesy
                    decoration: AppDecoration.neumorphicBackground,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          AppStrings.settingFontsHeadline,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: settingsModel.fontType,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateFontSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingFont1,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: settingsModel.fontType,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateFontSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingFont2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: settingsModel.fontType,
                                  onChanged: (value) {
                                    ref.read(settingsModelProvider).updateFontSize(value!);
                                  },
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  AppStrings.settingFont3,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
