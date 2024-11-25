import 'package:http/http.dart' as http;
import 'dart:convert';
import 'vault.dart';
import 'overall.dart';

//Currency exchange should look at the overall class
//The overall class has a list of vaults and a list of transactions
//the list of transactions needs to be converted & the list of transactions for each vault also needs to be converted

/*
    TODO:
    -DONE: might need to add variable to track original amount(CAD) in overall class, the current balance is being updated with the canadian rate causing it to lower and lower
    Reminder: The currentBalance in each vault class is recalculated based on the currency and does not have a variable to track original balanc(CAD)
    -trickle down to vault as well if we are doing charts for each vault account
    -add slide gesture on vaults account and display chart for each vault balance
    -change double precision to two decimals
    -make trackball display date below amount 
    -can change to apiBaseURL + personal key near submission time, 'rates' becomes 'conversion_rates'
    -remove fromCurrency if it is not neccessary
    ...
 */

class CurrencyConversion {
  final apiBaseUrl = 'https://api.exchangerate-api.com/v4/latest';

  void reset(Overall overall){
    overall.setCurrency("CAD");

    //reset transactions to original amounts
    for (var transaction in overall.getTransactions()){
      transaction.setAmount(transaction.getOriginalAmount()); 
    }

    //variable to reset overall class balance
    double newBalance = 0;
    //reset transactions in vaults and vaults to original amount
    for (var vault in overall.getListVaults()){
      vault.currency = "CAD";
      vault.setOriginalAmount(0);
      for (var transaction in vault.transactions){
        transaction.setAmount(transaction.getOriginalAmount());
        vault.incrementOriginalBalance(transaction);
      }
      newBalance += vault.getBalanceAmount();
    }
    overall.setCurrentBalance(newBalance);

  }
  Future <Overall> convert(Overall overall, String fromCurrency, String toCurrency) async{
    // final url = '${apiBaseUrl}/${fromCurrency}';
    //all conversions are done using the original amount therefore always look for currency in cad
    final url = '${apiBaseUrl}/CAD';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final exchangeData = json.decode(response.body);
      final rate = exchangeData['rates'][toCurrency];

      //convert balances in overall class to desired currency
      overall.setCurrency(toCurrency);

      //might need to add new variable to overall to grab "originalAmount"
      
      overall.setCurrentBalance(overall.getOriginalBalance() * rate);
      for(var transaction in overall.getTransactions()){
        // print(transaction.getOriginalAmount());
        // print(transaction.getAmount());
        transaction.updateAmount(rate);
        // print(transaction.getAmount());
      }

      //convert balance in each vault and list of transactions in each vault
      for(var vault in overall.getListVaults()){
        vault.updateCurrency(toCurrency, rate);

        // vault.setBalanceAmount(vault.getBalanceAmount() * rate);
        // vault.setGoalAmount(vault.getGoalAmount() * rate);
        // for(var transaction in vault.getTransactions()){
        //   transaction.resetToOriginalAmount();
        //   transaction.setAmount(transaction.getAmount() * rate);
        // }
      }
    }else{
      throw Exception('Exchange rate api not responding');
    }

    return overall;
  }
}