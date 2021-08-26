import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String mensagem) onChanged;
  final String title, value;
  final bool obscureText;
  final String hintText;
  final int maxLines;
  final int minLines;
  final Widget prefix;
  final Widget suffix;
  const PostTextField({
    Key key,
    this.onChanged,
    this.title,
    this.obscureText = false,
    this.value,
    this.hintText,
    this.textEditingController,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 7), child: Text("$title")),
              visible: title?.isNotEmpty ?? false),
          Container(
              height: maxLines == null ? 60 : null,
              child: TextField(
                  style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  maxLines: maxLines,
                  minLines: minLines,
                  controller: textEditingController,
                  obscureText: obscureText,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      prefixIcon: prefix,
                      suffixIcon: suffix,
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff248FE0), width: 2.4),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff248FE0)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      hintStyle: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[850]),
                      hintText: hintText,
                      fillColor: Colors.white)))
        ]);
  }
}
