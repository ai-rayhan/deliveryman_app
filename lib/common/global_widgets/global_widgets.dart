// import 'package:flutter/material.dart';

// // Custom AppBar widget
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? actions;

//   const CustomAppBar({Key? key, required this.title, this.actions}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       actions: actions,
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// // Custom Button widget
// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color? color;

//   const CustomButton({Key? key, required this.text, required this.onPressed, this.color}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(backgroundColor: color),
//       child: Text(text),
//     );
//   }
// }

// // Custom Loading Indicator
// class CustomLoadingIndicator extends StatelessWidget {
//   const CustomLoadingIndicator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }

// // Custom Error Widget
// class CustomErrorWidget extends StatelessWidget {
//   final String message;

//   const CustomErrorWidget({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.error_outline, color: Colors.red, size: 48),
//           const SizedBox(height: 16),
//           Text(message, style: const TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }