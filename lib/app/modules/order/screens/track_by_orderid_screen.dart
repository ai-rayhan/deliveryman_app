// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:deliveryman_app/common/enum/language_key.dart';
// import 'package:deliveryman_app/common/global_widgets/code_picker_widget.dart';
// import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
// import 'package:deliveryman_app/helper/translated_text.dart';
// import 'package:flutter/material.dart';


// class TrackByIdOrdersScreen extends StatefulWidget {
//   @override
//   State<TrackByIdOrdersScreen> createState() => _TrackByIdOrdersScreenState();
// }

// class _TrackByIdOrdersScreenState extends State<TrackByIdOrdersScreen> {
//   String countryDialCode = "+880";
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _orderidController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Orders'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//            CustomTextField(
//             controller: _orderidController,
//             hintText: "Order ID",
//             isRequired: true,
//             ),
//             const SizedBox(height: 16),
//             Row(children: [
//                Expanded(
//                    flex: 1,
//                    child: CustomTextField(
//                      prefixIcon: CodePickerWidget(
//                        onChanged: (CountryCode countryCode) {
//                          countryDialCode = countryCode.dialCode!;
//                        },
//                        initialSelection: "BD",
//                      ),
//                      hintText: LanKeys.enterPhoneNumber.key.translate,
//                      controller: _phoneController,
//                      // inputType: TextInputType.phone,
//                      divider: false,
//                      // validator: CustomValidator.validatePhone,
//                    )),
//                 ]),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {

//               },
//               child: const Text('Track Order'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50), // full width button
//               ),
//             ),
//           ],
//         ),
//       ),
    
//     );
//   }
// }
