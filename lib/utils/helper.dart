import 'regex.dart';

class Helper {
  static String? validatePhone(final phone) {
    return !RegExp(RGX_PHONE).hasMatch(phone)
        ? 'Số điện thoại không đúng!'
        : null;
  }

  static String? validatePassword(final password) {
    return !RegExp(RGX_PASSWORD).hasMatch(password)
        ? 'Mật khẩu định dạng sai!'
        : null;
  }

  static String dateTimeToSting(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    return '$day/$month/$year';
  }
}
