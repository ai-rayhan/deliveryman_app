import 'package:deliveryman_app/app/modules/currency/models/currency.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyController extends GetxController {
Currency selectedCurrency = Currency(code: 'BDT', symbol: '৳', exchangeRate: 1.0);

Future<void> saveSelectedCurrency(String currencyCode) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('selected_currency', currencyCode);
}

Future<String?> getSelectedCurrency() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selected_currency');
}

  void updateCurrency(Currency newCurrency) {
    selectedCurrency = newCurrency;
    update();
  }
   static CurrencyController get to => Get.find<CurrencyController>();
}
