// lib/ProfilePage/payment-method.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/user_info.dart';
import '../Classes/payment_method.dart';
import '../Classes/overall.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment Method'),
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
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full Name on Card'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name on the card';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(labelText: 'Card Number'),
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  validator: (value) {
                    if (value == null || value.length != 16) {
                      return 'Please enter a valid 16-digit card number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _expirationDateController,
                  decoration: InputDecoration(labelText: 'Expiration Date (MM/YY)'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the expiration date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(labelText: 'CVV'),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.length != 3) {
                      return 'Please enter a valid 3-digit CVV';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final overall = Provider.of<Overall>(context, listen: false);
                      final userInfo = overall.userInfo;
                      final paymentMethod = PaymentMethod.parameterized(
                        nameOnCard: _nameController.text,
                        cardNumber: _cardNumberController.text,
                        expiration: _expirationDateController.text,
                        cvv: _cvvController.text,
                      );
                      userInfo.paymentMethods.add(paymentMethod);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Card information saved. You now have ${userInfo.paymentMethods.length} cards linked.')),
                      );
                    }
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}