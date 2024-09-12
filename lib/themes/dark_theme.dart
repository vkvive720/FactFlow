import"package:flutter/material.dart";

ThemeData darkTheme= ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.blue,


  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black26,
    elevation: 3,
    shadowColor: Color(0x4e4e50)

  ),
  cardTheme: CardTheme(
    color: Color(0xff1e1f22)
  ),
  snackBarTheme: SnackBarThemeData(
    // backgroundColor: Color(0xff43454a),


  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Color(0x00ffffff),
  )

  );








