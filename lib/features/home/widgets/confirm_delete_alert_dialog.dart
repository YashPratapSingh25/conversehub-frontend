// import 'package:flutter/material.dart';
//
// class ConfirmDeleteAlertDialog extends StatelessWidget {
//   final String _title;
//   final String _message;
//   final VoidCallback _onConfirm;
//
//   const ConfirmDeleteAlertDialog({
//     super.key,
//     required this.title,
//     required this.message,
//     required this.onConfirm,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: colorScheme.onSurface,
//         ),
//       ),
//       content: Text(
//         message,
//         style: TextStyle(
//           fontSize: 14,
//           color: colorScheme.onSurfaceVariant,
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(false),
//           child: Text(
//             "Cancel",
//             style: TextStyle(color: colorScheme.primary),
//           ),
//         ),
//         FilledButton(
//           style: FilledButton.styleFrom(
//             backgroundColor: Colors.red,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           onPressed: () {
//             Navigator.of(context).pop(true);
//             onConfirm();
//           },
//           child: const Text("Delete"),
//         ),
//       ],
//     );
//   }
// }
