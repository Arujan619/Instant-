import 'dart:math';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'overall.dart';

class Vault {
  // Data members
  String name;
  int id;
  Image image;
  int daysRemaining;
  double goalAmount;
  double originalAmount;
  double balanceAmount;
  int cardLinkedId;
  bool isLocked;
  String currency;
  List <Transaction> transactions;
  LinearGradient gradient;
  // Constructors
  Vault()
      : name = '',
        id = DateTime.now().millisecondsSinceEpoch,
        image = Image.asset('assets/profile_picture.png'),
        daysRemaining = 0,
        goalAmount = 0.0,
        balanceAmount = 0.0,
        originalAmount = 0.0,
        cardLinkedId = 0,
        isLocked = false,
        transactions = [],
        currency = "CAD",
        gradient = LinearGradient(
          colors: [_generateRandomColor(), const Color(0xFF111735)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );//,
  //       transactions = [] {
  //   initTransaction();
  // }

  // Parameterized Constructor
  Vault.parameterized({
    required this.name,
    required this.image,
    required this.daysRemaining,
    required this.goalAmount,
    required this.originalAmount,
    required this.cardLinkedId,
    this.currency = "CAD",
    required Overall overall,
    required this.isLocked,
  })  : id = DateTime.now().millisecondsSinceEpoch,
        gradient = LinearGradient(
          colors: [_generateRandomColor(), const Color(0xFF111735)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        balanceAmount = originalAmount,
        transactions = [] {
    //initialize first transaction for vault and add transaction to overall
    if(balanceAmount>0){
      Transaction initialTransaction = Transaction.parameterized(
        vaultName: name, 
        vaultId: id,
        originalAmount: balanceAmount,
        transactionType: "Deposit",
        transactionDate: DateTime.now(),
        transactionTime:  '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}'
      );
      transactions.add(initialTransaction);  
      overall.addTransaction(initialTransaction);
    }
  }


  // Method to generate a random color
  static Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Setters
  void setName(String name) {
    this.name = name;
  }

  void setId(int id) {
    this.id = id;
  }

  void setImage(Image image) {
    this.image = image;
  }

  void setDaysRemaining(int daysRemaining) {
    this.daysRemaining = daysRemaining;
  }

  void setGoalAmount(double goalAmount) {
    this.goalAmount = goalAmount;
  }

  void setBalanceAmount(double balanceAmount) {
    this.balanceAmount = balanceAmount;
  }

  void setCardLinkedId(int cardLinkedId) {
    this.cardLinkedId = cardLinkedId;
  }

  void setIsLocked(bool isLocked) {
    this.isLocked = isLocked;
  }

  void addTransaction(Transaction transaction){
    transactions.add(transaction);
    incrementOriginalBalance(transaction);
  }

  void setOriginalAmount(double amount){
    originalAmount = amount;
  }

  void incrementOriginalBalance(Transaction transaction){
    if (transaction.transactionType == "Deposit"){
      originalAmount = originalAmount + transaction.getAmount();
    }
    else{
      originalAmount = originalAmount - transaction.getAmount();
      if (originalAmount < 0){
        originalAmount = 0;
      }
    }
    balanceAmount = originalAmount;
  }
  //NEED TO HANDLE CURRENT BALANCE STILL
  // Getters
  String getName() {
    return name;
  }

  int getId() {
    return id;
  }

  Image getImage() {
    return image;
  }

  int getDaysRemaining() {
    return daysRemaining;
  }

  double getGoalAmount() {
    return goalAmount;
  }

  double getBalanceAmount() {
    return balanceAmount;
  }

  double getOriginalAmount(){
    return originalAmount;
  }

  int getCardLinkedId() {
    return cardLinkedId;
  }

  // Helper method
  // Check if the vault is locked
  bool getIsLocked() {
    return isLocked;
  }

  List getTransactions(){
    return transactions;
  }

  // // Increment balance
  void incrementBalance(double amount) {
    balanceAmount += amount;
  }

  // Decrease balance
  void decreaseBalance(double amount) {
    balanceAmount -= amount;
  }

  void updateCurrency(String newCurrency, double exchangeRate){
    currency = newCurrency;
    balanceAmount = balanceAmount * exchangeRate;
    // goalAmount = goalAmount * exchangeRate;

    for(var transaction in transactions){
      transaction.updateAmount(exchangeRate);
    }
  }
}