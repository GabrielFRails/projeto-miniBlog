import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/AutenticarUsuario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase with Store {
  Usuario mUsuarioLogado;
  Usuario mUsuarioRetorno;
  ServicosDoMiniBlog mService = GetIt.I.get<ServicosDoMiniBlog>();

  @observable
  ObservableList<Usuario> usuariosBuscados = ObservableList<Usuario>();

  StatusConsulta mStatusConsultaUsuarios = StatusConsulta.CARREGANDO;

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
  ThemeMode themeMode = ThemeMode.light;

  BuildContext context;

  @observable
  ObservableList<Postagem> postsSeguidos = new ObservableList<Postagem>();

  @computed
  bool get isLoginValido =>
      email.contains("@") &&
      email.contains(".com") &&
      senha.isNotEmpty &&
      !senha.contains(" ");

  bool isCriador(String idUsuarioLogado, idCriadorPost) {
    return idUsuarioLogado == idCriadorPost;
  }

  void usuarioExiste({Function existe, Function naoExiste}) {
    _prefs.then((prefsDb) {
      String usuarioJson = prefsDb.getString("user");
      if (usuarioJson != null) {
        mUsuarioLogado = Usuario.fromJson(JsonCodec().decode(usuarioJson));
        existe?.call();
      } else {
        naoExiste?.call();
      }
    });
  }

  void logoutUsuario() {
    _prefs.then((db) {
      db.remove("user");
      db.remove("tokenUsuario");
      db.clear();
    });
  }

  void autenticarUsuario(Usuario usuarioLogar,
      {Function() sucesso,
      Function(String mensagem) erro,
      Function() carregando}) {
    carregando?.call();
    if ((usuarioLogar.email?.isEmpty ?? true) ||
        (usuarioLogar.senha?.isEmpty ?? true)) {
      erro?.call("Usuario ou senha inválidos!");
    } else {
      AutenticarUsuario autenticarUsuario = AutenticarUsuario(
          email: usuarioLogar.email, senha: usuarioLogar.senha);
      mService.autenticarUsuario(autenticarUsuario).then((value) {
        _prefs.then((db) {
          db.setString("tokenUsuario", value.token.toString());
          db.setString("user", JsonCodec().encode(value.autenticado.toJson()));
          sucesso?.call();
          mUsuarioLogado = value.autenticado;
        });
      }).catchError((onError) {
        erro?.call(onError.response.data["error"]);
      });
    }
  }

  void cadastrarUsuario(Usuario usuarioCadastrar,
      {Function() sucesso,
      Function(String mensagem) erro,
      Function() carregando}) {
    carregando?.call();
    if (usuarioCadastrar.email?.isEmpty ?? true) {
      erro?.call("E-mail Inválido");
    } else if (usuarioCadastrar.senha?.isEmpty ?? true) {
      erro?.call("Senha inválida");
    } else if (usuarioCadastrar.nome?.isEmpty ?? true) {
      erro?.call("Defina um nome");
    } else if (usuarioCadastrar.imagemPerfil?.isEmpty ?? true) {
      erro?.call("Defina uma foto de perfil");
    } else {
      mService.cadastrarUsuario(usuarioCadastrar).then((usuario) {
        sucesso?.call();
      }).catchError((onError) {
        erro?.call(onError.response.data["mensagem"]);
      });
    }
  }

  void editarUsuario(Usuario usuarioEditar, int idUsuario,
      {Function() sucesso, Function(String mensagem) erro}) {
    if (usuarioEditar.email == null) {
      usuarioEditar.email = mUsuarioLogado.email;
    }
    if (usuarioEditar.senha == null) {
      usuarioEditar.senha = mUsuarioLogado.senha;
    }
    if (usuarioEditar.nome == null) {
      usuarioEditar.nome = mUsuarioLogado.nome;
    }
    usuarioEditar.imagemPerfil = mUsuarioLogado.imagemPerfil;
    mService.editarUsuario(idUsuario, usuarioEditar).then((value) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["mensagem"]);
    });
  }

  void excluirUsuario(int idUsuario,
      {Function() sucesso, Function(String mensagem) erro}) {
    mService.excluirUsuario(idUsuario).then((value) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["error"]);
    });
  }

  void buscaUsuario(int idUsuario,
      {Usuario userRetorno,
      Function() sucesso,
      Function(String mensagem) erro}) {
    mService.buscarUsuario(idUsuario).then((value) {
      mUsuarioRetorno = value;
      userRetorno = value;
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["mensagem"]);
    });
  }

  void filtrarUsuarios(String nome,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mStatusConsultaUsuarios = StatusConsulta.CARREGANDO;
    mService.filtrarUsuarios(nome).then((responseUsers) {
      usuariosBuscados.clear();
      usuariosBuscados.addAll(responseUsers);
      mStatusConsultaUsuarios = StatusConsulta.SUCESSO;
      sucesso?.call();
    }).catchError((onError) {
      mStatusConsultaUsuarios = StatusConsulta.ERRO;
      erro?.call(onError.response.data["mensagem"]);
    });
  }
}
