
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/myCards/provider/cards_provider.dart';

import '../pages/settings/settings_model.dart';
import '../pages/theme/theme_model.dart';
import '../models/scroll_quote_model.dart';


final settingsModelProvider = ChangeNotifierProvider((ref) => SettingsModel()); //Settings Page
final scrollQuoteModelProvider = ChangeNotifierProvider((ref) => ScrollQuoteModel()); //Home Page
final themeProvider = ChangeNotifierProvider((ref) => ThemeModel()); // Theme Page
final addNewCardProvider = ChangeNotifierProvider((ref) => null);
//final categoryListProvider = ChangeNotifierProvider((ref) => CardsProvider());


