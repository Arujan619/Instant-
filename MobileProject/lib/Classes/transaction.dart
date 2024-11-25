import 'package:flutter/material.dart';

class Transaction {
  // Data members
  String vaultName;
  int vaultId;
  // Image vaultImage;
  double amount;
  double originalAmount;
  String transactionType;
  DateTime transactionDate;
  String transactionTime;
  String currency;

  // Constructor
  Transaction()
      : vaultName = '',
        vaultId = 0,
        // vaultImage = Image.asset('assets/default_vault.png'),
        amount = 0.0,
        originalAmount = 0.0,
        transactionType = '',
        transactionDate = DateTime.now(),
        currency = "CAD",
        transactionTime = '';

  Transaction.parameterized({
    required this.vaultName,
    required this.vaultId,
    // required this.vaultImage,
    required this.originalAmount,
    required this.transactionType,
    required this.transactionDate,
    required this.transactionTime,
    this.currency = "CAD",
  }) : amount = originalAmount;


  // Setters
  void setVaultName(String vaultName) {
    this.vaultName = vaultName;
  }

  void setVaultId(int vaultId) {
    this.vaultId = vaultId;
  }

  // void setVaultImage(Image vaultImage) {
  //   this.vaultImage = vaultImage;
  // }

  void setAmount(double amount) {
    this.amount = amount;
  }

  void setTransactionType(String transactionType) {
    this.transactionType = transactionType;
  }

  void setTransactionDate(DateTime transactionDate) {
    this.transactionDate = transactionDate;
  }

  void setTransactionTime(String transactionTime) {
    this.transactionTime = transactionTime;
  }

  // Getters
  String getVaultName() {
    return vaultName;
  }

  int getVaultId() {
    return vaultId;
  }

  // Image getVaultImage() {
  //   return vaultImage;
  // }

  double getAmount() {
    return amount;
  }

  String getTransactionType() {
    return transactionType;
  }

  DateTime getTransactionDate() {
    return transactionDate;
  }

  String getTransactionTime() {
    return transactionTime;
  }

  double getOriginalAmount(){
    return originalAmount;
  }
  // void resetToOriginalAmount() {
  //   amount = originalAmount;
  // }

  void updateAmount(double exchangeRate){
    amount = originalAmount * exchangeRate;
  }
}