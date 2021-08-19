import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase with Store {
  Usuario usuarioLogado;
  ServicosDoMiniBlog mService = GetIt.I.get<ServicosDoMiniBlog>();

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

  @observable
  ObservableList<Postagem> postsSeguidos = new ObservableList<Postagem>();

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
        usuarioLogado =
            Usuario.fromJson(JsonCodec().decode(usuarioJson));
        existe?.call();
      } else {
        naoExiste?.call();
      }
    });
  }

  void logoutUsuario() {
    _prefs.then((db) {
      db.remove("user");
    });
  }

  void autenticarUsuario(Usuario usuarioLogar,
      {Function() sucesso, Function(String mensagem) erro}) {
    if ((usuarioLogar.email?.isEmpty ?? true) ||
        (usuarioLogar.senha?.isEmpty ?? true)) {
      erro?.call("Usuario ou senha inválidos!");
    } else {
      mService.autenticarUsuario(usuarioLogar).then((usuario) {
        _prefs.then((db) {
          db.setString("user", JsonCodec().encode(usuario.sucesso.toJson()));
          usuarioLogado = usuario.sucesso;
          sucesso?.call();
        });
      }).catchError((onError) {
        erro?.call(onError.response.data["falha"]);
      });
    }
  }

  void cadastrarUsuario(Usuario usuarioCadastrar,
      {Function() sucesso, Function(String mensagem) erro}) {
    if (usuarioCadastrar.email?.isEmpty ?? true) {
      erro?.call("E-mail Inválido");
    } else if (usuarioCadastrar.senha?.isEmpty ?? true) {
      erro?.call("Senha inválida");
    } else if (usuarioCadastrar.nome?.isEmpty ?? true) {
      erro?.call("Defina um nome");
    } else {
      mService.cadastrarUsuario(usuarioCadastrar).then((usuario) {
        _prefs.then((db) {
          db.setString("user", JsonCodec().encode(usuario.sucesso.toJson()));
          usuarioLogado = usuario.sucesso;
          sucesso?.call();
        });
      }).catchError((onError) {
        erro?.call(onError.response.data["falha"]);
      });
    }
  }
}
