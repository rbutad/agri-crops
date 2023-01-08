import 'package:intl/intl.dart';

class Format {
  static String currency({required dynamic number}) {
    return NumberFormat.currency(
      locale: 'en_PH',
      name: 'PHP ',
      decimalDigits: 2,
    ).format(number);
  }
}
