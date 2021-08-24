import 'package:intl/intl.dart';

class UtilDataHora {
  static DateTime convert(dynamic data) {
    try {
      if (data is DateTime) {
        return data;
      }
      return DateFormat("dd/MM/yyyy HH:mm:ss").parse(data);
    } catch (e) {
      return null;
    }
  }
}
