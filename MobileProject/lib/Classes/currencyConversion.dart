import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'vault.dart';

class currencyConversion {
  final apiBaseUrl = 'https://api.exchangerate-api.com/v4/latest';

  //Could change the type of this function to person(overall) later
  //Could also add default currency variable to vault
  Future <Vault> convert(Vault vault, String fromCurrency, String toCurrency) async{
    final url = '${apiBaseUrl}/${fromCurrency}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final exchangeData = json.decode(response.body);
      final rate = exchangeData['rates'][toCurrency];
      vault.setBalanceAmount(vault.getBalanceAmount() * rate);
      vault.setGoalAmount(vault.getGoalAmount() * rate);
    }else{
      throw Exception('Exchange rate api not responding');
    }

    return vault;
  }
}

void main() async{

  currencyConversion converter = currencyConversion();

  Vault testVault = Vault.parameterized(
    name: 'Vacation Fund',
    image: Image.asset('assets/vacation_image.png'),
    daysRemaining: 30,
    goalAmount: 2000.0,
    balanceAmount: 500.0,
    cardLinkedId: 1234,
    isLocked: false,
  );

  print('Original Vault: $testVault');

  // Test CurrencyService
  try {
    var convertedVault = await converter.convert(testVault, 'CAD', 'USD');
    print('Converted Vault: $convertedVault');
  } catch (e) {
    print('Error: $e');
  }
}