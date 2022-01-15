// import 'package:flutter/material.dart';
// // import 'package:hackathon/screen/login_screen.dart';
// // import 'package:hackathon/screen/start_screen.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Gold effect',
//       routes: {
//         CreatePostScreen.routeName: (context) => const CreatePostScreen(),
//       },
//       home: const ScreenUtilSetup(child: HomeScreen()),
//     );
//   }
// }

// class ScreenUtilSetup extends StatelessWidget {
//   final Widget? child;
//   const ScreenUtilSetup({Key? key, this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
//       child: Builder(
//         builder: (context) {
//           ScreenUtil.init(
//             BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width,
//                 maxHeight: MediaQuery.\667),
//             orientation: Orientation.portrait,
//           );
//           return child!;
//         },
//       ),
//     );
//   }
// }
