import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';

class UtilStyle {
  static TextStyle text({double fontSize, FontWeight fontWeight}) =>
      GoogleFonts.nunitoSans(
          color: GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
              ? Colors.grey[850]
              : Colors.white,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static Color postContainer() {
    return GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
        ? Colors.white
        : Colors.grey[850];
  }

  static Color iconColor() {
    return GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
        ? Colors.grey[850]
        : Colors.white;
  }

  static Color shadowColor() {
    return GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
        ? Colors.black54
        : Colors.white;
  }

  static Color commentBox() {
    return GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
        ? Colors.black54
        : Color(0xff276B69);
  }

  static Color border() {
    return GetIt.I.get<ControladorUsuario>().themeMode == ThemeMode.light
        ? Colors.grey[300]
        : Colors.white;
  }
}
