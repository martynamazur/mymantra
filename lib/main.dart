import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [],);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
 //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  WidgetsFlutterBinding.ensureInitialized(); // Inicjalizacja wiązania usług
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(ProviderScope(child: MyApp()));
}
