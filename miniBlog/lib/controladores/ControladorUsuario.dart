import 'dart:convert';

import 'package:miniBlog/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase with Store {
  Usuario usuarioLogado = new Usuario();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @observable
  String email = "";
  @action
  void setEmail(value) => this.email = value;

  @observable
  String senha = "";
  @action
  void setSenha(value) => this.senha = value;

  @observable
  String nome = "";
  @action
  void setNome(value) => this.nome = value;

  @observable
  bool obscureText = true;
  @action
  void changeVisibility() {
    obscureText = !obscureText;
  }

  @computed
  bool get isLoginValido =>
      email.contains("@") &&
      email.contains(".com") &&
      senha.isNotEmpty &&
      !senha.contains(" ");

  void usuarioExiste({Function existe, Function naoExiste}) {
    _prefs.then((prefsDb) {
      String usuarioJson = prefsDb.getString("user");
      if (usuarioJson != null) {
        usuarioLogado = Usuario.fromJson(JsonCodec().decode(usuarioJson));
        existe?.call();
      } else {
        naoExiste?.call();
      }
    });
  }
}
