// import 'transaction.dart';
//
// class LockBox{
//   final String lockboxid;
//   final DateTime startDate;
//   final DateTime endDate;
//   double balance = 0;
//   final double goalAmount;
//   bool isLocked = false; //boxes are unlocked by default, might need to change when implementing creation of lockbox
//   final List<Transaction> transactions;
//
//   //Initialize our lockbox
//   LockBox({
//     required this.lockboxid,
//     required this.startDate,
//     required this.endDate,
//     required this.goalAmount,
//     List<Transaction>? transactions,
//   }): transactions = transactions ?? [];
//
//   //lock the box
//   void lock(){
//     isLocked = true;
//   }
//
//   //unlock the box
//   void unlock(){
//     isLocked = false;
//   }
//
//   // Adds a new transaction to the lockbox, run when user chooses to deposit
//   void addTransaction(Transaction transaction) {
//     if(!isLocked){
//       transactions.add(transaction);
//       getBalance();
//     }
//     else{ //might need to remove this in the final implementation
//       print("Lockbox is locked");
//     }
//   }
//
//   // Removes a specific transaction
//   void removeTransaction(Transaction transaction) {
//     if(!isLocked){
//       transactions.remove(transaction);
//       getBalance();
//     }
//     else{ //might need to remove this in the final implementation
//       print("Lockbox is locked");
//     }
//   }
//
//   //can change this to a string function, return strings depending on scenario
//   void withdraw(double amount){
//     if(!isLocked){
//       if(amount > balance){
//         print("Insufficient balance");
//       }
//       else{
//         var withdrawal = Transaction(
//           transactionID: '${DateTime.now().millisecondsSinceEpoch}',
//           date: DateTime.now(),
//           amount: amount,
//           transactionType: "withdrawal",
//         );
//         addTransaction(withdrawal);
//       }
//     }
//   }
//
//   // Provides the full history of transactions
//   List<Transaction> getTransactionHistory() {
//     return transactions;
//   }
//
//   // Calculates and updates the current balance
//   double getBalance() {
//     for (var transaction in transactions) {
//       if (transaction.transactionType == 'deposit') {
//         balance += transaction.amount;
//       } else if (transaction.transactionType == 'withdrawal') {
//         balance -= transaction.amount;
//       }
//     }
//     return balance;
//   }
//
//   double calculateProgress(){
//     return (balance / goalAmount) * 100;
//   }
// }