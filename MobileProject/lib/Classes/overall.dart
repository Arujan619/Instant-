import 'package:flutter/foundation.dart';
import 'user_info.dart';
import 'vault.dart';
import '../dbHelper.dart';
import '../Classes/transaction.dart';

class Overall extends ChangeNotifier {
  // Data members
  UserInfo userInfo;
  List<Vault> listVaults;
  String currentMonthYear;
  String currentDayMonthYear;
  double currentBalance;
  double currentProfit;
  List<Transaction> transactions;
  // Constructor
  Overall()
      : userInfo = UserInfo(),
        listVaults = [],
        currentMonthYear = '',
        currentDayMonthYear = '',
        currentBalance = 0.0,
        transactions = [],
        currentProfit = 0.0{
    //  _loadUserData();
  }

  Overall.parameterized({
    required this.userInfo,
    required this.listVaults,
    required this.currentMonthYear,
    required this.currentDayMonthYear,
    required this.currentBalance,
    required this.currentProfit,
    required this.transactions
  });

    // New methods for database integration
  void _loadUserData() async {
    final dbUser = await DatabaseHelper.instance.getUser();
    if (dbUser != null) {
      userInfo = dbUser;
      notifyListeners();
    }
  }
    
  void addTransaction(Transaction transaction){
    transactions.add(transaction);
    setBalance(transaction);
  }

  void setBalance(Transaction transaction){
    if (transaction.transactionType == "Deposit"){
      currentBalance = currentBalance + transaction.getAmount();
    }
    else{
      currentBalance = currentBalance - transaction.getAmount();
      if (currentBalance < 0){
        currentBalance = 0;
      }
    }
  }

  void saveUserInfo() async {
    await DatabaseHelper.instance.saveUser(userInfo);
    notifyListeners();
  }

  void updateUserInfo(UserInfo newUserInfo) async {
    userInfo = newUserInfo;
    await DatabaseHelper.instance.updateUserInfo(userInfo);
    notifyListeners();
  }

  // Setters
  void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
    notifyListeners();
  }

  void setListVaults(List<Vault> listVaults) {
    this.listVaults = listVaults;
    notifyListeners();
  }

  void addVault(Vault vault) {
    listVaults.add(vault);
    notifyListeners();
  }

  void removeVault(Vault vault) {
    listVaults.remove(vault);
    notifyListeners();
  }
  void setCurrentMonthYear() {
    DateTime now = DateTime.now();
    String month = _getMonthName(now.month);
    int year = now.year;
    currentMonthYear = '$month $year';
    notifyListeners();
  }

  void setCurrentDayMonthYear() {
    DateTime now = DateTime.now();
    String day = now.day.toString();
    String month = _getFullMonthName(now.month);
    int year = now.year;
    currentDayMonthYear = '$day $month, $year';
    notifyListeners();
  }

  void setCurrentBalance(double balance) {
    currentBalance = balance;
    notifyListeners();
  }

  void setCurrentProfit(double profit) {
    currentProfit = profit;
    notifyListeners();
  }

  // Getters
  UserInfo getUserInfo() {
    return userInfo;
  }

  List<Vault> getListVaults() {
    return listVaults;
  }

  List<Transaction> getTransactions(){
    return transactions;
  }

  double getCurrentBalance() {
    return currentBalance;
  }

  double getCurrentProfit() {
    return currentProfit;
  }

  String getCurrentMonthYear() {
    return currentMonthYear;
  }

  String getCurrentDayMonthYear() {
    return currentDayMonthYear;
  }

  // Helper methods
  String _getMonthName(int month) {
    const List<String> monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return monthNames[month - 1];
  }

  String _getFullMonthName(int month) {
    const List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}