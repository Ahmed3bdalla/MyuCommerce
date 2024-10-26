// import 'package:art_core/art_core.dart';
// import 'package:dependencies/dependencies.dart';

// bool hasMatch(String? s, String p) {
//   return (s == null) ? false : RegExp(p).hasMatch(s);
// }

// extension FormattedDate on String? {
//   String get replaceIfEmptyOrNull {
//     return (this == null || this!.isEmpty || this == 'null' || this == null.toString()) ? "---" : this!;
//   }
// }

// extension StringExtension on String {
//   // is null or empty returns "---"
//   String get emptyText => isEmptyOrNull ? '---' : this;

//   String get completeImageUrl {
//     String baseUrl = ApiConfigurations().baseUrlForImage;
//     if (startsWith('http')) {
//       return this;
//     } else {
//       return baseUrl + this;
//     }
//   }

//   String shortenName() {
//     List<String> words = split(' ');
//     String initials = words.map((word) => word[0].toUpperCase()).join(' ');
//     return initials;
//   }

//   /// Check email validation
//   bool validateEmail() => hasMatch(this, Patterns.email);

//   /// Check phone validation
//   bool validatePhone() => hasMatch(this, Patterns.phone);

//   bool validateImage() => hasMatch(this, Patterns.image);

//   bool validateName() => hasMatch(this, Patterns.name);

//   /// Check URL validation
//   bool validateURL() => hasMatch(this, Patterns.url);

//   /// Returns true if given  is null

//   /// Returns true if given String is null or isEmpty
//   bool get isEmptyOrNull => (isEmpty) || (this == 'null');

//   /// validate password
//   bool get isValidPassword => (length < 8) || (this == 'null');

//   // Check null string, return given value if null
//   String validate({String value = ''}) {
//     if (isEmptyOrNull) {
//       return value;
//     } else {
//       return this;
//     }
//   }

//   SizedBox toSvg({double? height, double? width, ColorFilter? colorFilter, Color? color}) {
//     if (color != null) colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
//     return SizedBox(
//       height: height ?? 24,
//       width: width ?? 24,
//       child: Center(child: SvgPicture.asset(validate(), fit: BoxFit.fill, colorFilter: colorFilter)),
//     );
//   }

//   String putDataIfEmpty({String value = ''}) {
//     if (isEmptyOrNull) {
//       return value;
//     } else {
//       return this;
//     }
//   }

//   bool isDigit() {
//     if (validate().isEmpty) {
//       return false;
//     }
//     if (validate().length > 1) {
//       for (var r in runes) {
//         if (r ^ 0x30 > 9) {
//           return false;
//         }
//       }
//       return true;
//     } else {
//       return runes.first ^ 0x30 <= 9;
//     }
//   }

//   /// Return int value of given string
//   int toInt({int defaultValue = 0}) {
//     if (isDigit()) {
//       return int.parse(this);
//     } else {
//       return defaultValue;
//     }
//   }

//   /// Return double value of given string
//   double toDouble({double defaultValue = 0.0}) {
//     try {
//       return double.tryParse(this) ?? 0;
//     } catch (e) {
//       return defaultValue;
//     }
//   }
// }

// class Patterns {
//   static String url =
//       r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

//   static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//   static String money = r'^\d{0,8}(\.\d{1,4})?$';

//   static String email = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

//   static String image = r'.(jpeg|jpg|gif|png|bmp)$';

//   static String name = r'[!@#%^&*(),.?":{}|<>]';

//   /// Excel regex
//   static String excel = r'.(xls|xlsx)$';

//   /// PDF regex
//   static String pdf = r'.pdf$';

//   /// Price regex
//   static String price = r'(\d{1,3})(?=(\d{3})+(?!\d))';
// }
