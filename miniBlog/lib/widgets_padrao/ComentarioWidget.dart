import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/util/UtilStyle.dart';

class ComentarioWidget extends StatelessWidget {
  final String avatar;
  final String username;
  final String timeAgo;
  final String text;
  final BuildContext context;
  final bool visible;
  final VoidCallback onPressedDelete;
  final Function onTap;

  const ComentarioWidget(
      {Key key,
      @required this.avatar,
      @required this.username,
      @required this.timeAgo,
      @required this.text,
      this.context,
      this.visible,
      this.onPressedDelete,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UtilStyle.postContainer(),
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
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundImage: NetworkImage(this.avatar ?? ""),
        ),
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
            padding: const EdgeInsets.only(right: 15),
            child: comentarioText(),
          ),
        ],
      ),
    );
  }

  Widget comentariotHeader() {
    return Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: Text(
              username,
              style: UtilStyle.text(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Spacer(),
          Container(
            child: visible
                ? PopupMenuButton(
                    icon: Icon(
                      FontAwesomeIcons.angleDown,
                      size: 14.0,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton(
                          child: Text(
                            "Excluir",
                            style: UtilStyle.text(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          onPressed: onPressedDelete,
                        ),
                        value: 2,
                      )
                    ],
                  )
                : SizedBox(
                    height: 50,
                  ),
          )
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
          height: 15,
        )
      ],
    );
  }
}
