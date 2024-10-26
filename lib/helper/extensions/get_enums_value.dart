// import 'package:art_core/art_core.dart';

// extension EnumToValue on int {
//   String get ganderValueTitle {
//     if (this == 0) {
//       return "male".tr();
//     } else {
//       return 'female'.tr();
//     }
//   }

//   String get roleValueTitle {
//     if (this == 0) {
//       return "unit_owner".tr();
//     } else {
//       return 'family_member'.tr();
//     }
//   }

//   String get statusValueTitle {
//     if (this == 0) {
//       return "Active";
//     } else {
//       return 'Suspend';
//     }
//   }

//   String get visitProgressValueTitle {
//     switch (this) {
//       case 0:
//         return "upcoming".tr();
//       case 1:
//         return "ongoing".tr();
//       case 2:
//         return "ended".tr();
//       case 3:
//         return "cancelled".tr();
//       case 4:
//         return "pending".tr();
//       case 5:
//         return "expired".tr();
//       default:
//         return "all_visits".tr();
//     }
//   }

//   String get visitProgressValueIcon {
//     switch (this) {
//       case 0:
//         return 'assets/icons_svg/upcoming_visit.svg';
//       case 1:
//         return 'assets/icons_svg/ongoing_visit.svg';
//       case 2:
//         return 'assets/icons_svg/past_visit.svg';
//       case 3:
//         return 'assets/icons_svg/canceled_visit.svg';
//       case 4:
//         return 'assets/icons_svg/pending_visit.svg';
//       case 5:
//         return 'assets/icons_svg/expired_visit.svg';
//       default:
//         return 'assets/icons_svg/ongoing_visit.svg';
//     }
//   }

//   String get visitorStatusValueTitle {
//     switch (this) {
//       case 0:
//         return "absent".tr();
//       case 1:
//         return "checked_in".tr();
//       case 2:
//         return "checked_out".tr();
//       case 3:
//         return "overdue".tr();
//       default:
//         return "absent".tr();
//     }
//   }

//   String get notificationType {
//     switch (this) {
//       case 0:
//         return "all".tr();
//       case 1:
//         return "my_notifications".tr();
//       case 2:
//         return "by_admin".tr();
//       default:
//         return "all".tr();
//     }
//   }

//   String get notificationTypeToApi {
//     switch (this) {
//       case 0:
//         return "";
//       case 1:
//         return "notifications";
//       case 2:
//         return "announcements";
//       default:
//         return "";
//     }
//   }
// }

// extension ValueToEnum on String {
//   int? get visitProgressEnumValue {
//     if (this == "upcoming_visits".tr()) {
//       return 0;
//     } else if (this == "ongoing_visits".tr()) {
//       return 1;
//     } else if (this == "ended_visits".tr()) {
//       return 2;
//     } else if (this == "cancelled_visits".tr()) {
//       return 3;
//     } else if (this == "pending_visits".tr()) {
//       return 4;
//     } else if (this == "expired_visits".tr()) {
//       return 5;
//     } else {
//       return null;
//     }
//   }

//   Color get bookingStateColor {
//     switch (this) {
//       case 'UPCOMING':
//         return AppColors.upcoming;
//       case 'ONGOING':
//         return AppColors.ongoing;
//       case 'REJECTED':
//         return AppColors.rejected;
//       case 'CANCELLED':
//         return AppColors.canceled;
//       // case 'expired':
//       //   return AppColors.expired;
//       case 'ENDED':
//         return AppColors.ended;
//       case 'PENDING':
//         return AppColors.pending;
//       default:
//         return AppColors.grey;
//     }
//   }

//   String get bookingStateTitle {
//     switch (this) {
//       case 'upcoming':
//         return 'Upcoming';
//       case 'ongoing':
//         return 'Ongoing';
//       case 'rejected':
//         return 'Rejected';
//       case 'canceled':
//         return 'Canceled';
//       case 'expired':
//         return 'Expired';
//       case 'ended':
//         return 'Ended';
//       case 'pending':
//         return 'Pending';
//       default:
//         return 'N/A';
//     }
//   }

//   String get serviceRequestStateTitle {
//     switch (this) {
//       case 'PENDING_ACCEPTANCE':
//         return 'Pending Approval';
//       case 'PENDING_APPROVAL':
//         return 'Pending Approval'; 
//       case 'ACCEPTED':
//         return 'Accepted';
//       case 'COMPLETED':
//         return 'Completed';
//       case 'CANCELLED':
//         return 'Cancelled';
//       case 'REJECTED':
//         return 'Rejected';
//       case 'ACTION_REQUIRED':
//         return 'Action Required';
//       case 'CLOSED':
//         return 'Closed';
//       default:
//         return 'N/A';
//     }
//   }

//   Color get serviceRequestStateColor {
//     switch (this) {
//       case 'PENDING_ACCEPTANCE':
//         return AppColors.pendingApprovalColorServiceRequest;
//       case 'PENDING_APPROVAL':
//         return AppColors.pendingApprovalColorServiceRequest; 
//       case 'ACCEPTED':
//         return AppColors.acceptedColorServiceRequest;
//       case 'COMPLETED':
//         return AppColors.completedColorServiceRequest;
//       case 'CANCELLED':
//         return AppColors.cancelledColorServiceRequest;
//       case 'REJECTED':
//         return AppColors.rejectedColorServiceRequest;
//       case 'ACTION_REQUIRED':
//         return AppColors.actionRequiredColorServiceRequest;
//       case 'CLOSED':
//         return AppColors.closedColorServiceRequest;
//       default:
//         return AppColors.grey;
//     }
//   }
// }
