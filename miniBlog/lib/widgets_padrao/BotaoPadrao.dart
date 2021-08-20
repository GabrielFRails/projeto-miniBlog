import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoPadrao extends StatelessWidget {
  final String value;
  final Function() onTap;
  final Color background;
  final BuildContext context;
  const BotaoPadrao(
      {Key key, this.value, this.onTap, this.background, this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color(0xff4BD4CF),
              Color(0xff0ABAB4),
              Color(0xff078783),
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
