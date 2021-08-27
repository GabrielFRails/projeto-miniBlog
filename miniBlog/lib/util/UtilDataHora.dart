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

  static String getDiaMesHoraMinuto(dynamic data) {
    try {
      if (data is String) {
        data = convert(data);
      }
      return DateFormat("dd/MM HH:mm").format(data);
    } catch (e) {
      return null;
    }
  }
}
