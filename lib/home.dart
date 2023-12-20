import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miltilingual/localization/Language/language_hi.dart';
import 'package:provider/provider.dart';

import 'provider/language_provider.dart';
import 'localization/Language/language_ar.dart';
import 'localization/Language/language_en.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);
    var currentLanguage = languageProvider.currentLanguage;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.black,title: Text(currentLanguage.appName, style: TextStyle(color: Colors.blue),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(color: Colors.white,
                width: double.maxFinite,
                child: Center(child: Text( currentLanguage.welcome, style: TextStyle(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),))),
          ),
          SizedBox(height: 56,),

          //English
          GestureDetector(onTap: () {
            languageProvider.changeLanguage(LanguageEn(), "LanguageEn");
          },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.blue,),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Text("English", style: TextStyle(color: Colors.white),),
            ),
          ),

          SizedBox(height: 8,),

          //Arabic
          GestureDetector(onTap: () {
            languageProvider.changeLanguage(LanguageAr(), "LanguageAr");
          },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.blue,),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Text("Arabic", style: TextStyle(color: Colors.white),),
            ),
          ),

          SizedBox(height: 8,),

          //Hindi
          GestureDetector(onTap: () {
            languageProvider.changeLanguage(LanguageHi(), "LanguageHi");
          },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.blue,),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Text("Hindi", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
