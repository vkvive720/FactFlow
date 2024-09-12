import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/themes/dark_theme.dart';
import 'package:news_app/themes/light_theme.dart';

class ThemeProvider with ChangeNotifier{

  ThemeData _theme=darkTheme;
  List favourite_news=[];
  is_favourate(String s){

    for(int i=0;i<favourite_news.length;i++)
      {
        if(s==favourite_news[i]['url']){
          return true;
        }
      }
    return false;

  }

  make_favourite(var item)
  {
    favourite_news.add(item);
    notifyListeners();
  }

  Future<List>Give_favourite()async{

    return favourite_news;
  }





  ThemeData get theme_deta =>_theme;

  set theme_data(ThemeData theme_deta){
    _theme=theme_deta;
  }
  void toggle_theme(){
    if(_theme==lightTheme)
      {
        _theme=darkTheme;
      }
    else{
      _theme=lightTheme;
    }
    notifyListeners();
  }
}