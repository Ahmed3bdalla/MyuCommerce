

// extension TimeDate on String {
//   String get time {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('h:mma', 'en').format(dateTime.toLocal()).toString();
//     } else {
//       return this;
//     }
//   }

//   String get time12HourWithAmPm {
//     DateTime dateTime = DateFormat("HH:mm:ss").parse(this);
//     return DateFormat('h:mm a').format(dateTime).toLowerCase();
//   }

//   String get date {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat("E d MMMM", 'en').format(dateTime.toLocal()).toString();
//     } else {
//       return this;
//     }
//   }

//   String get dateToEvent {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat("dd MMM hh:mm a", 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get dateMonth {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat("dd MMM , yyyy", 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get dateMonthTime {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat("dd MMM , yyyy hh:mm a", 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get fullDate {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('dd-MM-yyyy', 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get fullDateDay {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('EEEE, d MMM yyyy', 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get fullDateTimeToChat {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('hh:mm a - d,MMMM,y', 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get fullDateTime {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('yyyy-MM-dd hh:mm a', 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get formatISO {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return dateTime.toIso8601String();
//     } else {
//       return this;
//     }
//   }

//   String get dateToApiFormat {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat('yyyy-MM-dd', 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String get dateTimeToApiFormat {
//     DateTime? dateTime = DateTime.tryParse(this);
//     if (dateTime != null) {
//       return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'", 'en')
//           .format(dateTime.toLocal())
//           .toString();
//     } else {
//       return this;
//     }
//   }

//   String? calculateNotificationTime() {
//     DateTime parsedDate = DateTime.parse(this).toLocal();
//     Duration diff = DateTime.now().difference(parsedDate);

//     if (Modular.get<PreferenceManager>().currentLang() == 'ar') {
//       if (diff.inSeconds < 60) {
//         return 'الآن';
//       } else if (diff.inMinutes < 60) {
//         return 'منذ ${diff.inMinutes} دقيقة${diff.inMinutes == 1 ? '' : 'ات'}';
//       } else if (diff.inHours < 24) {
//         return 'منذ ${diff.inHours} ساعة${diff.inHours == 1 ? '' : 'ات'}';
//       } else if (diff.inDays < 7) {
//         return 'منذ ${diff.inDays} يوم${diff.inDays == 1 ? '' : 'أيام'}';
//       } else if (diff.inDays < 30) {
//         return 'منذ ${(diff.inDays / 7).floor()} أسبوع${(diff.inDays / 7).floor() == 1 ? '' : 'ات'}';
//       } else if (diff.inDays < 365) {
//         return 'منذ ${(diff.inDays / 30).floor()} شهر${(diff.inDays / 30).floor() == 1 ? '' : 'ات'}';
//       } else {
//         return 'منذ ${(diff.inDays / 365).floor()} سنة${(diff.inDays / 365).floor() == 1 ? '' : 'ات'}';
//       }
//     } else {
//       if (diff.inSeconds < 60) {
//         return 'just now';
//       } else if (diff.inMinutes < 60) {
//         return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
//       } else if (diff.inHours < 24) {
//         return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
//       } else if (diff.inDays < 7) {
//         return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
//       } else if (diff.inDays < 30) {
//         return '${(diff.inDays / 7).floor()} week${(diff.inDays / 7).floor() == 1 ? '' : 's'} ago';
//       } else if (diff.inDays < 365) {
//         return '${(diff.inDays / 30).floor()} month${(diff.inDays / 30).floor() == 1 ? '' : 's'} ago';
//       } else {
//         return '${(diff.inDays / 365).floor()} year${(diff.inDays / 365).floor() == 1 ? '' : 's'} ago';
//       }
//     }
//   }
// }

// extension TimestampToFormattedDate on int {
//   String toFormattedDate() {
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);
//     DateFormat formatter = DateFormat('dd-MM-yyyy - hh:mm a', 'en');
//     return formatter.format(dateTime);
//   }
// }
