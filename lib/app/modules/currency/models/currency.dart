class Currency {
  final String code;
  final String symbol;
  final double exchangeRate; 

  Currency({
    required this.code,
    required this.symbol,
    required this.exchangeRate,
  });
}
List<Currency> availableCurrencies = [
  Currency(code: 'BDT', symbol: '৳', exchangeRate: 1.0),
  Currency(code: 'USD', symbol: '\$', exchangeRate: 0.0084),
  Currency(code: 'EUR', symbol: '€', exchangeRate: 0.0078),
];
