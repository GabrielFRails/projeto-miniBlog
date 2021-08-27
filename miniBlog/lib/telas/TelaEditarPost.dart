import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/PostTextField.dart';

class TelaEditarPost extends StatefulWidget {
  const TelaEditarPost({Key key}) : super(key: key);

  @override
  _TelaPostarState createState() => _TelaPostarState();
}

class _TelaPostarState extends State<TelaEditarPost> {
  ControladorPost _controladorPost = GetIt.I.get<ControladorPost>();
  Postagem _postagem = new Postagem();
  bool isPostValido = false;
  TextEditingController _textEditingController = new TextEditingController();
  @override
  void initState() {
    _textEditingController.text = _controladorPost.postEditar.conteudo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: SingleChildScrollView(
              child: Card(
                  elevation: 4,
                  shadowColor: Colors.teal[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Wrap(spacing: 15, runSpacing: 15, children: [
                        Container(
                          width: 500,
                          child: PostTextField(
                              minLines: 1,
                              maxLines: 7,
                              textEditingController: _textEditingController,
                              hintText: "Qual a indireta de hoje?",
                              onChanged: (text) {
                                _postagem.conteudo = text;
                                text.length > 0
                                    ? setState(() {
                                        isPostValido = true;
                                      })
                                    : setState(() {
                                        isPostValido = false;
                                      });
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            botaoPostar(
                                onPressed: isPostValido
                                    ? () {
                                        _controladorPost.editarPostagem(
                                            _postagem,
                                            _controladorPost.postEditar.id,
                                            sucesso: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  "/telaPrincipal",
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }, erro: (msg) {
                                          UtilDialogo.exibirAlerta(context,
                                              mensagem: msg, titulo: "Ops");
                                        }, carregando: () {
                                          UtilDialogo.showLoading(context);
                                        });
                                      }
                                    : () {
                                        Fluttertoast.showToast(
                                            msg: "O campo não pode estar vazio",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2);
                                      }),
                          ],
                        )
                      ]))))),
    ));
  }

  Widget botaoPostar({Function() onPressed}) {
    return Container(
        height: 30.0,
        width: 100,
        child: RaisedButton(
            disabledColor: Colors.grey,
            color: Color(0xff248FE0),
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: onPressed,
            child: Text(
              "Publicar",
              style: TextStyle(color: Colors.white),
            )));
  }
}
