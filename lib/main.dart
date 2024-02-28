import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:scholar_scraper_app/theme/theme.dart';
import 'data_provider.dart';
import 'firebase_options.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      theme:  TAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      title: 'Scholar Scraper App',
      home: LoginScreen(),
    );
  }
}
