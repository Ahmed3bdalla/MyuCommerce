// import 'package:core/core.dart';
// import 'package:intl/intl.dart';
// extension TimeFormatting on String {
//   String formatTimeToAMPM() {
//     // Parse the time string
//     List<String> parts = split(':');
//     int hour = int.parse(parts[0]);
//     int minute = int.parse(parts[1]);

//     // Convert to AM/PM format
//     String period = hour < 12 ? 'AM' : 'PM';
//     hour = hour % 12;
//     hour = hour == 0 ? 12 : hour;

//     // Format the time
//     String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';
//     return formattedTime;
//   }
// }

// extension DateFormatting on DateTime {
//   String get formatDate {
//     return DateFormat('yyyy-MM-dd','en').format(this);
//   }
//   // 12-9-2021 12:00:00 PM
//   String get formatDateTime {
//     return DateFormat('dd-MM-yyyy hh:mm:ss a','en').format(this);
//   }
// }

// extension FormatDateTime on DateTime? {
//   String? format({String format = "yyyy-MM-dd"}) {
//     if (this == null) {
//       return null;
//     }

//     DateFormat outputFormat = DateFormat(format,'en');
//     return outputFormat.format(this!);
//   }
// }
