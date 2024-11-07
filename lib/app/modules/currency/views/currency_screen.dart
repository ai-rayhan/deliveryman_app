import 'package:deliveryman_app/app/modules/currency/controllers/currency_controller.dart';
import 'package:deliveryman_app/app/modules/currency/models/currency.dart';
import 'package:deliveryman_app/common/global_widgets/selection_card.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("currency".translate),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("select_currency".translate,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
            GetBuilder<CurrencyController>(
              builder: (controller) {
                return Expanded(child: 
                ListView.builder(
                  itemCount: availableCurrencies.length,
                  itemBuilder: (context, index) {
                  return SelectionCard(
                    title:availableCurrencies[index].code,
                     isSelected: controller.selectedCurrency.code == availableCurrencies[index].code,
                     hints: "${availableCurrencies[index].symbol} ",
                     onTap: (){
                      controller.updateCurrency(availableCurrencies[index]);
                     },
                    
                    );
                },));
              }
            )
          ],
        ),
      ),
    );
  }
}