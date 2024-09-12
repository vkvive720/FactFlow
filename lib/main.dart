import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/themes/dark_theme.dart';
import 'package:news_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

import 'functions/calling_api.dart';
import 'functions/theme_provider.dart';

void main()
{
  runApp(ChangeNotifierProvider(
    create: (context)=>ThemeProvider(),
      child: My_app()));
}

class My_app extends StatefulWidget {
  const My_app({super.key});

  @override
  State<My_app> createState() => _My_appState();
}

class _My_appState extends State<My_app> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context,theme_pro,child)=>
      MaterialApp(
      theme: theme_pro.theme_deta,
      // darkTheme: Provider.of<ThemeProvider>(context).theme_deta,
      debugShowCheckedModeBanner: false,
      home:Home_page(),
    ));

  }
}

