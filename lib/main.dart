import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'provider/language_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    languageProvider.loadSavedLanguage();

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Multilingual',
          theme: ThemeData(
            useMaterial3: true,
          ),
          locale: languageProvider.locale,
          home: Home(),
          supportedLocales: [
            Locale('en', ''),
            Locale('hi', ''),
            Locale('ar', ''), // Add other supported locales as needed
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
