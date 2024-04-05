import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mymantra/config/app_utils.dart';
import 'package:mymantra/pages/home/domain/use_cases/capture_screenshot_manager.dart';
import 'package:mymantra/pages/home/provider/audio_provider.dart';
import 'package:mymantra/pages/home/domain/use_cases/share_content_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:vibration/vibration.dart';
import '../../../providers/providers.dart';
//import 'package:vibration/vibration.dart';



class Home extends ConsumerWidget {
  final ScreenshotController _screenshotController = ScreenshotController();

  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollQuoteModel = ref.watch(scrollQuoteModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xE8EBF2FF),
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ref.read(themeProvider).currentBackgroundPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Screenshot(
                controller: _screenshotController,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          ref.read(themeProvider).currentBackgroundPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: ref.read(scrollQuoteModelProvider).quotes.length,
                    onPageChanged: (int page) {
                      if (ref.read(scrollQuoteModelProvider).currentPage !=
                          page) {
                        ref.read(scrollQuoteModelProvider).updatePage(page);
                      }
                    },
                    itemBuilder: (context, index) {
                      return Consumer(
                        builder: (context, ref, child) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                ref
                                    .read(scrollQuoteModelProvider)
                                    .quotes[index]
                                    .quote_content,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppUtils.getSizeFromSettings(
                                      ref.read(settingsModelProvider).textSize),
                                  fontStyle: AppUtils.getFontFromSettings(
                                      ref.read(settingsModelProvider).fontType),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              _actionBar(
                context,
                ref,
                scrollQuoteModel,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionBar(BuildContext context, WidgetRef ref, scrollQuoteModel) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: AppUtils.setThemeDesign(
                      ref.read(themeProvider).backgroundChoice),
                  child: IconButton(
                    icon: Icon(
                      scrollQuoteModel.quotes.isNotEmpty &&
                              scrollQuoteModel
                                      .quotes[scrollQuoteModel.currentPage]
                                      .is_favourite ==
                                  1
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white60,
                    ),
                    onPressed: () async {
                      // Do something
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: AppUtils.setThemeDesign(
                      ref.read(themeProvider).backgroundChoice),
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {
                      ShareContentManager(_screenshotController).onShareXFileFromScreenshot(context);
                    },
                    icon: const Icon(Icons.share),
                    color: Colors.white60,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: AppUtils.setThemeDesign(
                      ref.read(themeProvider).backgroundChoice),
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () async {
                      ScreenshotManager screenshotManager =
                          ScreenshotManager(_screenshotController);
                      await screenshotManager.capturePicture(context);
                    },
                    icon: const Icon(Icons.file_download_outlined),
                    color: Colors.white60,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: AppUtils.setThemeDesign(
                      ref.read(themeProvider).backgroundChoice),
                  padding: const EdgeInsets.all(8),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final isSoundOn = ref.watch(isSoundOnProvider);

                      return IconButton(
                        onPressed: () {
                          if(isSoundOn){
                            ref.read(isSoundOnProvider.notifier).state = false;
                          }else{
                            ref.read(isSoundOnProvider.notifier).state = true;
                            //ref.read(audioProvider).speak(quotes[index].quote_content);

                            //audio.speak(quotes[index].quote_content);

                          }

                        },
                        icon:  ref.watch(isSoundOnProvider) == true
                            ? Icon(FeatherIcons.volume1)
                            : Icon(FeatherIcons.volumeX),
                        color: Colors.white60,
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.1),
            ),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/Menu');
              },
              icon: const Icon(
                Icons.menu,
                size: 14,
                color: Colors.white,
              ),
              label: const Text(
                'Menu',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
