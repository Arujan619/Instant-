import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/overall.dart';
import '../Classes/payment_method.dart';
import '../Classes/vault.dart';

class DepositPage extends StatefulWidget {
  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _formKey = GlobalKey<FormState>();
  PaymentMethod? _selectedPaymentMethod;
  Vault? _selectedVault;
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final overall = Provider.of<Overall>(context);
    final paymentMethods = overall.userInfo.getPaymentMethods();
    final vaults = overall.getListVaults();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Deposit'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/emback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DropdownButtonFormField<PaymentMethod>(
                  decoration: InputDecoration(labelText: 'Select Payment Method'),
                  items: paymentMethods.map((PaymentMethod method) {
                    return DropdownMenuItem<PaymentMethod>(
                      value: method,
                      child: Text(method.getCardNumber()),
                    );
                  }).toList(),
                  onChanged: (PaymentMethod? newValue) {
                    setState(() {
                      _selectedPaymentMethod = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a payment method' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount Desired (\$00.00)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<Vault>(
                  decoration: InputDecoration(labelText: 'Select Vault'),
                  items: vaults.map((Vault vault) {
                    return DropdownMenuItem<Vault>(
                      value: vault,
                      child: Text(vault.getName()),
                    );
                  }).toList(),
                  onChanged: (Vault? newValue) {
                    setState(() {
                      _selectedVault = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a vault' : null,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the deposit action here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Deposit action handled')),
                      );
                    }
                  },
                  child: Text('Deposit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}