// import 'package:deliveryman_app/common/global_widgets/appbar.dart';
// import 'package:deliveryman_app/helper/translated_text.dart';
// import 'package:easy_stepper/easy_stepper.dart';
// import 'package:flutter/material.dart';

// class OrderTrackingScreen extends StatefulWidget {
//   const OrderTrackingScreen({Key? key}) : super(key: key);

//   @override
//   State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
// }

// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   final List<String> steps = [
//     'waiting_step',
//     'order_received_step',
//     'preparing_step',
//     'on_way_step',
//     'delivered_step',
//   ];

//   int activeStep = 2;

//   // Dummy delivery man information
//   final String deliveryManName = 'John Doe';
//   final String deliveryManPhoneNumber = '123-456-7890';
//   final String deliveryManImage =
//       'https://i.imgur.com/BoN9kdC.png'; // Replace with your image URL

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: showAppBar(
//         context: context,
//         text:'order_tracking'.translate
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             EasyStepper(
//               activeStep: activeStep,
//               activeStepTextColor: Colors.amber,
//               // finishedStepTextColor:  Colors.white,
//               internalPadding: 10,
//               showLoadingAnimation: false,
//               stepRadius: 8,
//               showStepBorder: false,
//               steps: [
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 0 ? Colors.orange : Colors.grey,
//                     ),
//                   ),
//                   title: 'waiting_step'.translate,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 1 ? Colors.orange : Colors.grey,
//                     ),
//                   ),
//                   title: 'order_received_step'.translate,
//                   topTitle: true,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 2 ? Colors.orange : Colors.grey,
//                     ),
//                   ),
//                   title: 'preparing_step'.translate,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 3 ? Colors.orange : Colors.grey,
//                     ),
//                   ),
//                   title: 'on_way_step'.translate,
//                   topTitle: true,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 4 ? Colors.orange : Colors.grey,
//                     ),
//                   ),
//                   title: 'delivered_step'.translate,
//                 ),
//               ],
//               onStepReached: (index) => setState(() => activeStep = index),
//             ),
//             Spacer(),
//             _buildDeliveryManInfo(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDeliveryManInfo() {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'delivery_man_information_title'.translate,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 16),
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 30,
//                 backgroundImage: NetworkImage(deliveryManImage),
//               ),
//               SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'name_label'.translate + ': $deliveryManName',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'phone_label'.translate + ': $deliveryManPhoneNumber',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
