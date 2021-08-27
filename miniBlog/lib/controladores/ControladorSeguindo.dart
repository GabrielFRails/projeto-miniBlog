import 'package:get_it/get_it.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';

part 'ControladorSeguindo.g.dart';

class ControladorSeguindo = _ControladorSeguindoBase with _$ControladorSeguindo;

//Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

abstract class _ControladorSeguindoBase with Store {
  ServicosDoMiniBlog mService = GetIt.I.get<ServicosDoMiniBlog>();

  ObservableList<Usuario> followBuscados = ObservableList<Usuario>();
  ObservableList<Usuario> followersBuscados = ObservableList<Usuario>();

  StatusConsulta mStatusConsultaFollow = StatusConsulta.CARREGANDO;
  StatusConsulta mStatusConsultaFollowers = StatusConsulta.CARREGANDO;
  int numeroFollow;
  int numeroFollowers;

  bool isUsuarioLogadoSeguindo(Usuario usuarioPesquisa) {
    print(usuarioPesquisa);
    return followersBuscados.indexWhere(
            (userSeguido) => userSeguido.id == usuarioPesquisa.id) ==
        -1;
  }

  void seguirUsuario(int id,
      {Function() sucesso, Function(String mensagem) erro}) {
    mService.seguirUsuario(id).then((value) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }

  void unfollowUsuario(int id,
      {Function() sucesso, Function(String mensagem) erro}) {
    mService.unFollowUser(id).then((value) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }

  void listarSeguindo(
      {String email,
      Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mStatusConsultaFollow = StatusConsulta.CARREGANDO;
    mService.listarSeguindo(email: email).then((responseFollows) {
      followBuscados.clear();
      followBuscados.addAll(responseFollows);
      mStatusConsultaFollow = StatusConsulta.SUCESSO;
      numeroFollow = responseFollows.length;
      sucesso?.call();
    }).catchError((onError) {
      mStatusConsultaFollow = StatusConsulta.ERRO;
      erro?.call(onError.response.data["falha"]);
    });
  }

  void listarSeguidores(
      {String email,
      Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mStatusConsultaFollowers = StatusConsulta.CARREGANDO;
    mService.listarMeusSeguidores(email: email).then((responseFollowers) {
      followersBuscados.clear();
      followersBuscados.addAll(responseFollowers);
      mStatusConsultaFollowers = StatusConsulta.SUCESSO;
      numeroFollowers = responseFollowers.length - 1;
      sucesso?.call();
    }).catchError((onError) {
      mStatusConsultaFollowers = StatusConsulta.ERRO;
      erro?.call(onError.response.data["falha"]);
    });
  }
}

/*void filtrarUsuarios(String nome,
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
      erro?.call(onError.response.data["falha"]);
    });
  } */
