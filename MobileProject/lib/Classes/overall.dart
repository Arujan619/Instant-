import 'package:flutter/foundation.dart';
import 'user_info.dart';
import 'vault.dart';

class Overall extends ChangeNotifier {
  // Data members
  UserInfo userInfo;
  List<Vault> listVaults;
  String currentMonthYear;
  String currentDayMonthYear;
  double currentBalance;
  double currentProfit;

  // Constructor
  Overall()
      : userInfo = UserInfo(),
        listVaults = [],
        currentMonthYear = '',
        currentDayMonthYear = '',
        currentBalance = 0.0,
        currentProfit = 0.0;

  Overall.parameterized({
    required this.userInfo,
    required this.listVaults,
    required this.currentMonthYear,
    required this.currentDayMonthYear,
    required this.currentBalance,
    required this.currentProfit,
  });

  // Setters
  void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
    notifyListeners();
  }

  void setListVaults(List<Vault> listVaults) {
    this.listVaults = listVaults;
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