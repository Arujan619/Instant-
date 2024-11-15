import 'package:flutter/material.dart';

class Vault {
  // Data members
  String name;
  int id;
  Image image;
  int daysRemaining;
  double goalAmount;
  double balanceAmount;
  int cardLinkedId;
  bool isLocked;

  // Constructors
  Vault()
      : name = '',
        id = 0,
        image = Image.asset('assets/default_vault.png'),
        daysRemaining = 0,
        goalAmount = 0.0,
        balanceAmount = 0.0,
        cardLinkedId = 0,
        isLocked = false;

  Vault.parameterized({
    required this.name,
    required this.id,
    required this.image,
    required this.daysRemaining,
    required this.goalAmount,
    required this.balanceAmount,
    required this.cardLinkedId,
    required this.isLocked,
  });

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

  int getCardLinkedId() {
    return cardLinkedId;
  }
}