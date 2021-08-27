import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicoDioProvider {
  final dio = Dio();

  String token;

  Future<void> getToken() async {
    if (token == null) {
      await SharedPreferences.getInstance()
          .then((db) => token = db.getString("tokenUsuario"));
    } else {
      await SharedPreferences.getInstance()
          .then((db) => token = db.getString("tokenUsuario"));
    }
  }

  Dio getDio() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      getToken();
      if ((!(options.path.contains("authenticate"))) &&
          !((options.path.contains(
                      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios") &&
                  options.path.length == 57) &&
              (options.method == "POST")))
        options.headers.addAll({"Authorization": "Bearer $token"});
    }));
    return dio;
  }
}
