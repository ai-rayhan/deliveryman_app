
import 'package:deliveryman_app/app/modules/currency/controllers/currency_controller.dart';

extension CurrencyExtension on num {
  String toCurrency() {
    final controller = CurrencyController.to;
    final convertedValue = this * controller.selectedCurrency.exchangeRate;
    return '${controller.selectedCurrency.symbol} ${convertedValue.toStringAsFixed(2)}';
  }

}
