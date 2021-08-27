import 'package:flutter/material.dart';
import 'package:miniBlog/util/UtilStyle.dart';

class TextFieldPadrao extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String mensagem) onChanged;
  final String title, value;
  final bool obscureText;
  final String hintText;
  final Widget prefix;
  final Widget suffix;
  final int maxLines;
  const TextFieldPadrao(
      {Key key,
      this.maxLines,
      this.onChanged,
      this.title,
      this.obscureText = false,
      this.value,
      this.hintText,
      this.textEditingController,
      this.prefix,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: Color(0xff248FE0)),
          child: TextField(
            style: UtilStyle.text(),
            obscureText: obscureText,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefixIcon: prefix,
              suffixIcon: suffix,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300],
                  width: 2.6,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300], width: 1.2)),
              hintText: hintText,
              hintStyle: UtilStyle.text(fontSize: 18),
            ),
          ),
        ));
  }
}
