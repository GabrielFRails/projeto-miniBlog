import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoPadrao extends StatelessWidget {
  final String value;
  final Function() onTap;
  final Color background;
  const BotaoPadrao({Key key, this.value, this.onTap, this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ])),
        child: Center(
          child: Text(
            "$value",
            style: GoogleFonts.nunitoSans(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
