import 'package:flutter_tts/flutter_tts.dart';

class Audio {
  late FlutterTts flutterTts;

  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? selectedVoice;

  Audio() {
    flutterTts = FlutterTts();
  }

  Future<void> setVoice(String voice) async {
    selectedVoice = voice;
    await flutterTts.setVoice({
      'name': selectedVoice ?? 'default',
      'locale': '',
      'quality': '',
      'latency': '',
      'network': '',
    });
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage(language ?? 'en-US');
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setVolume(volume);

    if (selectedVoice != null) {
      await flutterTts.setVoice({
        'name': selectedVoice!,
        'locale': '',
        'quality': '',
        'latency': '',
        'network': '',
      });
    }

    await flutterTts.speak(text);
  }
}
