import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostagemWidget extends StatelessWidget {
  final String avatar;
  final String username;
  final String name;
  final String timeAgo;
  final String text;
  final String comments;
  final String favorites;

  const PostagemWidget(
      {Key key,
      @required this.avatar,
      @required this.username,
      @required this.name,
      @required this.timeAgo,
      @required this.text,
      @required this.comments,
      @required this.favorites})
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
      margin: const EdgeInsets.all(10.0),
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
          postText(),
          postButtons(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget postHeader() {
    final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: Text(
            this.username,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '@$name · $timeAgo',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        PopupMenuButton(
          key: _key,
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

  void choiceAction(String choice) {
    print("working");
  }

  Widget postText() {
    return Text(
      text,
      overflow: TextOverflow.clip,
    );
  }

  Widget postButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          postIconButton(FontAwesomeIcons.comment, this.comments),
          SizedBox(width: 15),
          postIconButton(FontAwesomeIcons.heart, this.favorites),
        ],
      ),
    );
  }

  Widget postIconButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.0,
          color: Colors.black45,
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}

class EditarEExcluir {
  static const String editar = "editar";
  static const String excluir = "excluir";

  static const List<String> escolhas = [editar, excluir];
}
