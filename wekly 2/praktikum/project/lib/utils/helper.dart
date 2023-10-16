import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String parseDateInd(String? input, String format) {
  //? exp format 'EEE dd MMMM yyyy HH:mm'
  try {
    initializeDateFormatting();
    if (input!.isEmpty || input == "-") {
      return "-";
    } else {
      final dateTime = DateTime.parse(input);
      final dateIndo = DateFormat(format, "id_ID").format(dateTime);
      return dateIndo;
    }
  } catch (e) {
    return input?.toString() ?? "-";
  }
}
