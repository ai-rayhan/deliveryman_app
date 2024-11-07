// import 'package:flutter/material.dart';

// class OrderHistoryScreen extends StatefulWidget {
//   const OrderHistoryScreen({Key? key}) : super(key: key);

//   @override
//   State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
// }

// class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
//   // final List<Map<String, dynamic>> orderHistory = [
//   //   {
//   //     'imageUrl':
//   //         'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/07/1296x728-header.jpg?w=1155&h=1528',
//   //     'orderId': '#008306',
//   //     'subtitle': '26 Jan 2024, 4:30 PM',
//   //     'status': 'Delivered',
//   //   },
//   //   {
//   //     'imageUrl':
//   //         'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/07/1296x728-header.jpg?w=1155&h=1528',
//   //     'orderId': '#008309',
//   //     'subtitle': '29 Jan 2024, 3:15 PM',
//   //     'status': 'Cancelled',
//   //   },
//   //   {
//   //     'imageUrl':
//   //         'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/07/1296x728-header.jpg?w=1155&h=1528',
//   //     'orderId': '#008310',
//   //     'subtitle': '30 Jan 2024, 12:45 PM',
//   //     'status': 'Delivered',
//   //   },
//   //   // Add more orders as needed
//   // ];

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'delivered':
//         return Colors.green; // Set your desired color for 'Delivered'
//       case 'cancelled':
//         return Colors.red; // Set your desired color for 'Cancelled'
//       default:
//         return Colors.grey; // Set a default color for other statuses
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 300, // Set a fixed height or adjust as needed
//         child: ListView.builder(
//           itemCount: orderHistory.length,
//           itemBuilder: (context, index) {
//             final order = orderHistory[index];

//             return Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: NetworkImage(order['imageUrl'])),
//                   title: Text('Order ID: ${order['orderId']}'),
//                   subtitle: Text(order['subtitle']),
//                   trailing: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
//                         decoration: BoxDecoration(
//                           color: _getStatusColor(order['status']),
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         child: Text(
//                           order['status'],
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
