// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorUsuario.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorUsuario on _ControladorUsuarioBase, Store {
  Computed<bool> _$isLoginValidoComputed;

  @override
  bool get isLoginValido =>
      (_$isLoginValidoComputed ??= Computed<bool>(() => super.isLoginValido,
              name: '_ControladorUsuarioBase.isLoginValido'))
          .value;

  final _$usuariosBuscadosAtom =
      Atom(name: '_ControladorUsuarioBase.usuariosBuscados');

  @override
  ObservableList<Usuario> get usuariosBuscados {
    _$usuariosBuscadosAtom.reportRead();
    return super.usuariosBuscados;
  }

  @override
  set usuariosBuscados(ObservableList<Usuario> value) {
    _$usuariosBuscadosAtom.reportWrite(value, super.usuariosBuscados, () {
      super.usuariosBuscados = value;
    });
  }

  final _$emailAtom = Atom(name: '_ControladorUsuarioBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_ControladorUsuarioBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$nomeAtom = Atom(name: '_ControladorUsuarioBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$obscureTextAtom = Atom(name: '_ControladorUsuarioBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  final _$themeModeAtom = Atom(name: '_ControladorUsuarioBase.themeMode');

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  final _$postsSeguidosAtom =
      Atom(name: '_ControladorUsuarioBase.postsSeguidos');

  @override
  ObservableList<Postagem> get postsSeguidos {
    _$postsSeguidosAtom.reportRead();
    return super.postsSeguidos;
  }

  @override
  set postsSeguidos(ObservableList<Postagem> value) {
    _$postsSeguidosAtom.reportWrite(value, super.postsSeguidos, () {
      super.postsSeguidos = value;
    });
  }

  final _$_ControladorUsuarioBaseActionController =
      ActionController(name: '_ControladorUsuarioBase');

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_ControladorUsuarioBaseActionController.startAction(
        name: '_ControladorUsuarioBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ControladorUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo = _$_ControladorUsuarioBaseActionController.startAction(
        name: '_ControladorUsuarioBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_ControladorUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(dynamic value) {
    final _$actionInfo = _$_ControladorUsuarioBaseActionController.startAction(
        name: '_ControladorUsuarioBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_ControladorUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisibility() {
    final _$actionInfo = _$_ControladorUsuarioBaseActionController.startAction(
        name: '_ControladorUsuarioBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_ControladorUsuarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuariosBuscados: ${usuariosBuscados},
email: ${email},
senha: ${senha},
nome: ${nome},
obscureText: ${obscureText},
themeMode: ${themeMode},
postsSeguidos: ${postsSeguidos},
isLoginValido: ${isLoginValido}
    ''';
  }
}
