import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/cart_items_provider.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/provider/value_provider.dart';
import 'package:la_vapiano/screen/ask_language/select_language_screen.dart';
import 'package:la_vapiano/screen/food_history/provider/history_provider.dart';
import 'package:la_vapiano/screen/home/provider/bottom_nav_provider.dart';
import 'package:la_vapiano/shared_preference/shared_preference_provider.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/start/splash_screen.dart';
import 'package:la_vapiano/utils/language/applocalization.dart';
import 'package:la_vapiano/utils/language/language_constant.dart';
import 'package:la_vapiano/utils/language/localString.dart';
import 'package:la_vapiano/utils/language/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Locale? _locale;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getLocale().then((locale) {
      this._locale = locale;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
          ChangeNotifierProvider(create: (_) => ValueProvider()),
          ChangeNotifierProvider(create: (_) => HistoryProvider()),
          ChangeNotifierProvider(create: (_) => LanguageCodeProvider()),
          ChangeNotifierProvider(create: (_) => SharedPreferenceProvider()),
          ChangeNotifierProvider(create: (_) => CartItemsProvider()),
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ],
      child: Consumer<LanguageProvider>(
        builder: (context,language, child){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            translations: LocatString(),
            locale:  language.locale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('fa', 'IR'),
              Locale('ar', 'SA'),
            ],
            textDirection:language.locale.languageCode == "ar" ||  language.locale.languageCode == "fa" ? TextDirection.rtl : TextDirection.ltr,
            localizationsDelegates:  const[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale,supportedLocales){
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
            ),
            // home: const SplashScreen(),
            home:  SplashScreen(),
          );
        },
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
