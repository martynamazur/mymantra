import 'package:flutter/material.dart';
import 'package:mymantra/pages/aboutApp/about_app.dart';
import 'package:mymantra/pages/generator/generate_quotes/screens/ai_quote_generator.dart';
import 'package:mymantra/pages/generator/save_generated_quotes/save_generated_quotes.dart';
import 'package:mymantra/pages/importData/cloud_synchronization.dart';
import 'package:mymantra/database/database_helper.dart';
import 'package:mymantra/pages/home/home.dart';

import 'package:mymantra/pages/myCards/my_cards.dart';
import 'package:mymantra/pages/menu/menu.dart';
import 'package:mymantra/pages/reminders/reminders.dart';
import 'package:mymantra/pages/settings/settings.dart';

import 'package:mymantra/pages/theme/theme_page.dart';


class MyApp extends StatelessWidget {
  //final SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  MyApp({super.key}) {
    //sharedPrefHelper.initialize();
    databaseHelper.initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        '/MyCards': (context) => MyCards(),
        '/ThemeApp': (context) => ThemeScreen(),
        '/CloudSynchronization': (context) => CloudSynchronization(),
        '/Reminders': (context) => Reminders(),
        '/Settings': (context) => Settings(),
        '/AboutAppScreen': (context) => AboutApp(),
        '/Menu': (context) => const MenuScreen(),
        '/Home': (context) => Home(),
        '/SaveQuote': (context) => SaveQuote(),
        '/AiQuoteGenerator': (context) => AiQuoteGenerator(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEBEFF2),
      ),
    );
  }
}
