import 'package:flutter/material.dart';
import 'package:mymantra/pages/about_app.dart';
import 'package:mymantra/pages/cloud_synchronization.dart';
import 'package:mymantra/database/database_helper.dart';
import 'package:mymantra/pages/home.dart';

import 'package:mymantra/pages/my_cards.dart';
import 'package:mymantra/pages/menu.dart';
import 'package:mymantra/pages/reminders.dart';
import 'package:mymantra/pages/settings.dart';

import 'package:mymantra/pages/theme_page.dart';

class MyApp extends StatelessWidget {
  //final SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  final DatabaseHelper databaseHelper = DatabaseHelper(); // Tworzysz instancję DatabaseHelper


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
        '/Menu': (context) =>  const MenuScreen(),
        '/Home': (context) => Home()
      },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEBEFF2),
      ),
    );
  }
}

