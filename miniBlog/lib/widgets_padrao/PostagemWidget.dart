import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostagemWidget extends StatelessWidget {
  final String avatar;
  final String username;
  final String timeAgo;
  final String text;
  final int comments;
  final String favorites;
  final BuildContext context;
  final VoidCallback onPressedComment;
  final VoidCallback onPressedLike;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedEdit;
  final Color color;
  final bool visible;

  const PostagemWidget(
      {Key key,
      @required this.avatar,
      @required this.username,
      @required this.timeAgo,
      @required this.text,
      @required this.comments,
      @required this.favorites,
      @required this.onPressedComment,
      this.context,
      this.onPressedLike,
      this.color,
      this.visible, this.onPressedDelete, this.onPressedEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postAvatar(),
          postBody(),
        ],
      ),
    );
  }

  Widget postAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 10, 0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(this.avatar),
      ),
    );
  }

  Widget postBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postHeader(),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: postText(),
          ),
          postButtons(),
        ],
      ),
    );
  }

  Widget postHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: Text(this.username,
              style: GoogleFonts.nunitoSans(
                  fontSize: 17, fontWeight: FontWeight.bold)),
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
                        child: Text("Editar",
                            style: GoogleFonts.nunitoSans(
                                color: Color.fromRGBO(143, 148, 251, .9),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        onPressed: onPressedEdit,
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        child: Text(
                          "Excluir",
                          style: GoogleFonts.nunitoSans(
                              color: Color.fromRGBO(143, 148, 251, .9),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
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
    );
  }

  Widget postText() {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: GoogleFonts.nunitoSans(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  Widget postButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          postIconButton(
              icon: FontAwesomeIcons.comment,
              text: this.comments.toString(),
              onPressed: onPressedComment),
          SizedBox(width: 15),
          postIconButton(
              icon: FontAwesomeIcons.heart,
              text: this.favorites,
              onPressed: onPressedLike,
              color: color),
        ],
      ),
    );
  }

  Widget postIconButton(
      {IconData icon, String text, Function() onPressed, Color color}) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: onPressed,
          iconSize: 14.0,
          color: Colors.black45,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
