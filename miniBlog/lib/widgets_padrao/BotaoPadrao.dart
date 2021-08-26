import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoPadrao extends StatelessWidget {
  final String value;
  final Function() onTap;
  final BuildContext context;
  const BotaoPadrao(
      {Key key, this.value, this.onTap, this.context})
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
          color: Color(0xff248FE0),
          // gradient: LinearGradient(colors: [
          //   Color(0xff34D7F7),
          //   Color(0xff248FE0),
          //   Color(0xff2869FC),
          // ])
        ),
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
