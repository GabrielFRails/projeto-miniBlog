import 'package:flutter/material.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class UtilDialogo {
  static void exibirAlerta(BuildContext context,
      {String titulo, String mensagem}) {
    var alert = Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color.fromRGBO(81, 85, 90, 1),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
          backgroundColor: Colors.white,
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
                    Text(mensagem),
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
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green[300],
                      ))));
        });
  }
}
