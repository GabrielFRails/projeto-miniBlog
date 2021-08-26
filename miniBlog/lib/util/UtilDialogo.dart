import 'package:flutter/material.dart';
import 'package:miniBlog/util/UtilStyle.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class UtilDialogo {
  static void exibirAlerta(BuildContext context,
      {String titulo, String mensagem, Function() onTap}) {
    var alert = Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
          backgroundColor: UtilStyle.postContainer(),
          title: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Color.fromRGBO(81, 85, 90, 1),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(child: Text(titulo)),
              ],
            ),
          ),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    if (mensagem != null) Text(mensagem),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BotaoPadrao(
                    value: "Ok",
                    onTap: () {
                      Navigator.pop(context);
                      onTap?.call();
                    },
                  ),
                ),
              )
            ],
          ),
          actions: [],
        ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff2869FC)),
                        backgroundColor: Color(0xff248FE0),
                      ))));
        });
  }
}
