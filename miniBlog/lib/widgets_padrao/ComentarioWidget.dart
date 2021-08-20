import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComentarioWidget extends StatelessWidget {
  final String avatar;
  final String username;
  final String timeAgo;
  final String text;
  final BuildContext context;

  const ComentarioWidget(
      {Key key,
      @required this.avatar,
      @required this.username,
      @required this.timeAgo,
      @required this.text,
      this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          comentarioAvatar(),
          comentarioBody(),
        ],
      ),
    );
  }

  Widget comentarioAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 10, 0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
    );
  }

  Widget comentarioBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          comentariotHeader(),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
            child: comentarioText(),
          ),
        ],
      ),
    );
  }

  Widget comentariotHeader() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: Text(username,
                style: GoogleFonts.nunitoSans(
                    fontSize: 17, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget comentarioText() {
    return Column(
      children: [
        Text(
          text,
          overflow: TextOverflow.clip,
          style:
              GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
