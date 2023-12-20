import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localization/Language/languages.dart';
import 'localization/locale_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Languages.of(context)!.appName, style: TextStyle(color: Colors.blue),),),
      body: Column(
        children: [
          Text( Languages.of(context)!.labelWelcome, style: TextStyle(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),),
          GestureDetector(onTap: () {
            changeLanguage(context, "ar");
          },
            child: Container(
              color: Colors.deepOrange,
              child: Text("Change"),
            ),
          )
        ],
      ),
    );
  }
}
