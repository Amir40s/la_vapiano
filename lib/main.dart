
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/provider/value_provider.dart';
import 'package:la_vapiano/screen/ask_language/select_language_screen.dart';
import 'package:la_vapiano/screen/food_history/provider/history_provider.dart';
import 'package:la_vapiano/screen/home/provider/bottom_nav_provider.dart';
import 'package:la_vapiano/shared_preference/shared_preference_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
          ChangeNotifierProvider(create: (_) => ValueProvider()),
          ChangeNotifierProvider(create: (_) => HistoryProvider()),
          ChangeNotifierProvider(create: (_) => LanguageCodeProvider()),
          ChangeNotifierProvider(create: (_) => SharedPreferenceProvider()),
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
           // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
        // home: const SplashScreen(),
        home:  SelectLanguageScreen(),
      ),
    );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //    // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    //     useMaterial3: true,
    //   ),
    //   home:  MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
    //     ],
    //     child: const SplashScreen(),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
