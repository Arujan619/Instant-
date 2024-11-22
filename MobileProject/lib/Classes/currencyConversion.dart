import 'package:http/http.dart' as http;
import 'dart:convert';
import 'vault.dart';


class CurrencyConversion {
  //can change to apiBaseURL + personal key near submission time, 'rates' becomes 'conversion_rates'
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