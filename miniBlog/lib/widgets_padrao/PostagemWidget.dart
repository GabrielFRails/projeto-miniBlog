import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostagemWidget extends StatelessWidget {
  final String avatar;
  final String username;
  final String timeAgo;
  final String text;
  final String comments;
  final String favorites;
  final BuildContext context;

  const PostagemWidget(
      {Key key,
      @required this.avatar,
      @required this.username,
      @required this.timeAgo,
      @required this.text,
      @required this.comments,
      @required this.favorites,
      this.context})
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
        PopupMenuButton(
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
                onPressed: () {},
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
                onPressed: () {},
              ),
              value: 2,
            )
          ],
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
              text: this.comments,
              onPressed: () {
                Navigator.of(context).pushNamed("/telaComentario");
              }),
          SizedBox(width: 15),
          postIconButton(
              icon: FontAwesomeIcons.heart,
              text: this.favorites,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget postIconButton({IconData icon, String text, Function() onPressed}) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
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
