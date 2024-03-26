import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mymantra/models/scroll_quote_model.dart';
import 'package:mymantra/pages/custom_style/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../providers/providers.dart';



class Home extends ConsumerWidget {

  final ScreenshotController _screenshotController = ScreenshotController();
  //late Timer _scrollTimer;

  Home({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final settingsModel = ref.watch(settingsModelProvider);
    final scrollQuoteModel = ref.watch(scrollQuoteModelProvider);
    final scaffoldContext = ScaffoldMessenger.of(context);


    return Scaffold(
      backgroundColor: Color(0xE8EBF2FF),
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
                      image: AssetImage(ref.read(themeProvider).currentBackgroundPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: ref.read(scrollQuoteModelProvider).quotes.length,
                    onPageChanged: (int page) {
                      if (ref.read(scrollQuoteModelProvider).currentPage != page) {
                        //wywolac metode do zmiany
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
                                ref.read(scrollQuoteModelProvider).quotes[index].quote_content,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: getSizeFromSettings(ref.read(settingsModelProvider).textSize),
                                  fontStyle:  getFontFromSettings(ref.read(settingsModelProvider).fontType),
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

             _actionBar(context, ref, scrollQuoteModel,)
            ],
          ),
        ),
      ),
    );
  }


  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informacja'),
          content: Text('Zapisano do galerii'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void saveImage(Uint8List imageBytes) async {
    final result = await ImageGallerySaver.saveImage(imageBytes);
    if (result['isSuccess']) {
      print('Obraz został pomyślnie zapisany do galerii!');
    } else {
      print('Wystąpił błąd podczas zapisywania obrazu: ${result['error']}');
    }
  }
  

  void capturePicture() {
    _screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
      if (capturedImage != null) {
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        Directory tempDir = await getTemporaryDirectory();
        String path = tempDir.path;
        saveImage(capturedImage);

        await _screenshotController.captureAndSave(
          path,
          fileName: fileName,
        );

      } else {
        // Błąd przechwytywania obrazu
      }
    });
  }

  void _shareContent(){
    //Share.share(text)
    //Share.share('check out my website https://example.com');
  }

  double getSizeFromSettings(int textSize) {
    return {
      0: 16.0,
      1: 20.0,
      2: 24.0,
    }[textSize] ?? 20.0;
  }

  FontStyle getFontFromSettings(int fontType) {
    switch (fontType) {
      case 0:
        return FontStyle.normal;
      case 1:
        return FontStyle.italic;
      case 2:
        return FontStyle.normal; // lub FontStyle.italic w zależności od wybranego fontu
      default:
        return FontStyle.normal;
    }
  }

  BoxDecoration setThemeDesign(int style){
    switch(style){
      case 0:
        return AppDecoration.neumorphicBackground;
      case 1 || 2 || 3:
        return AppDecoration.transparentBackground;

      default:
        return AppDecoration.neumorphicBackground;
    }
  }
  
  
  Widget _actionBar(BuildContext context, WidgetRef ref, scrollQuoteModel){

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: setThemeDesign(ref.read(themeProvider).backgroundChoice),
                  child: IconButton(
                    icon: Icon(
                      scrollQuoteModel.quotes.isNotEmpty &&
                          scrollQuoteModel.quotes[scrollQuoteModel.currentPage].is_favourite == 1
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white60
                    ),
                    onPressed: () async {
                      // Do something
                    },
                  ),
                ),
                Spacer(),

                Container(
                  decoration: setThemeDesign(ref.read(themeProvider).backgroundChoice),
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {
                      _shareContent();
                    },
                    icon: Icon(Icons.share),
                    color: Colors.white60
                  ),
                ),
                Spacer(),
                Container(
                  decoration: setThemeDesign(ref.read(themeProvider).backgroundChoice),
                  padding: EdgeInsets.all(8),

                  child: IconButton(
                    onPressed: () async {
                      capturePicture();
                      _showPopup(context);
                    },
                    icon: Icon(Icons.file_download_outlined),
                    color: Colors.white60
                  ),
                ),
                Spacer(),
                Container(
                  decoration: setThemeDesign( ref.read(themeProvider).backgroundChoice) ,
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {
                      ref.read(scrollQuoteModelProvider).isSoundOff = ref.read(scrollQuoteModelProvider).isSoundOff == 1 ? 0 : 1;
                    },
                    icon: ref.read(scrollQuoteModelProvider).isSoundOff == 1
                        ? Image.asset('assets/images/sound_on.png', height: 25, width: 22)
                        : Image.asset('assets/images/sound_off.png', height: 25, width: 22),
                    color: Colors.white60
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
              icon: Icon(Icons.menu, size: 14, color: Colors.white,),
              label: Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  )),
            ),
          ),
        ],
      ),
    );
  }
/*
  void _startAutoScroll(){
    _scrollTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      _scrollToNextItem();
    });
  }

 */

  void _scrollToNextItem(){
    //final currentPage = ref.read(scrollQuoteModelProvider).currentPage;
    //final itemCount = ref.read(scrollQuoteModelProvider).quotes.length;
    //final nextPage = (currentPage + 1) % itemCount;
    //ref.read(scrollQuoteModelProvider).updatePage(nextPage);
  }


}









