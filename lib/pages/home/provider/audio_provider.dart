

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/audio_model.dart';

// female/male voice assistant this screen is dependent on other screen


// turning off/on
final audioProvider = StateProvider((ref) {
  final Audio audio = Audio();
});

final isSoundOnProvider = StateProvider<bool>((ref) => false);