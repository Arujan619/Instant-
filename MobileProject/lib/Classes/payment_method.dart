class PaymentMethod {
  // Data members
  String nameOnCard;
  String cardNumber;
  String expiration;
  String cvv;

  // Default constructor
  PaymentMethod()
      : nameOnCard = '',
        cardNumber = '',
        expiration = '',
        cvv = '';

  // Parameterized constructor
  PaymentMethod.parameterized({
    required this.nameOnCard,
    required this.cardNumber,
    required this.expiration,
    required this.cvv,
  });

  // Setters
  void setNameOnCard(String nameOnCard) {
    this.nameOnCard = nameOnCard;
  }

  void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }

  void setExpiration(String expiration) {
    this.expiration = expiration;
  }

  void setCvv(String cvv) {
    this.cvv = cvv;
  }

  // Getters
  String getNameOnCard() {
    return nameOnCard;
  }

  String getCardNumber() {
    return cardNumber;
  }

  String getExpiration() {
    return expiration;
  }

  String getCvv() {
    return cvv;
  }
}