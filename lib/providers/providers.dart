import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/favourite_model.dart';

import '../models/settings_model.dart';
import '../models/theme_model.dart';
import '../models/scroll_quote_model.dart';

final settingsModelProvider = ChangeNotifierProvider((ref) => SettingsModel()); //Settings Page
final scrollQuoteModelProvider = ChangeNotifierProvider((ref) => ScrollQuoteModel()); //Home Page
final themeProvider = ChangeNotifierProvider((ref) => ThemeModel()); // Theme Page
//final favouriteProvider = ChangeNotifierProvider((ref) => FavouriteModel());

