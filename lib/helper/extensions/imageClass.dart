// import 'package:art_core/art_core.dart';
// import 'package:dependencies/dependencies.dart';
//
// class AppImage extends StatelessWidget {
//   final String path;
//   final double? height, width;
//   final BoxFit fit;
//   final Color? color;
//
//   const AppImage(
//     this.path, {
//     super.key,
//     this.height,
//     this.width,
//     this.fit = BoxFit.scaleDown,
//     this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     switch (true) {
//       case String path when path.endsWith("svg"):
//         return SvgPicture.asset(
//           path,
//           fit: fit,
//           height: height,
//           width: width,
//           color: color,
//         );
//       case String path when path.startsWith("http"):
//         return Image.network(
//           path,
//           fit: fit,
//           height: height,
//           width: width,
//           color: color,
//         );
//       // case String path when path.endsWith("json"):
//       //   return Lottie.asset(
//       //     path,
//       //     fit: fit,
//       //     height: height,
//       //     width: width,
//       //   );
//       default:
//         return Image.asset(
//           path,
//           height: height,
//           width: width,
//           fit: fit,
//           color: color,
//         );
//     }
//   }
// }
