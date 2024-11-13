class Transaction{
  //transactionID will currently be the date, we can use the UUID dependency later on 
  final String transactionID;
  final double amount;
  final DateTime date;
  final String transactionType;

  //Initialize transaction
  Transaction({
    required this.transactionID,
    required this.amount,
    required this.date,
    required this.transactionType
  });

  String getTransactionDetails(){
    return 'Transaction ID: $transactionID, Date: $date, Amount: $amount, Type: $transactionType';
  }

}