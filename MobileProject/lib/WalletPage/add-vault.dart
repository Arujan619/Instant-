import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/overall.dart';
import '../Classes/vault.dart';

class AddVaultPage extends StatefulWidget {
  @override
  _AddVaultPageState createState() => _AddVaultPageState();
}

class _AddVaultPageState extends State<AddVaultPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  Image? _image;
  int _daysRemaining = 0;
  double _goalAmount = 0.0;

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
        title: Text('Add Vault'),
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
                GestureDetector(
                  onTap: () async {
                    // Implement image picker here
                    // For now, we use a placeholder image
                    _image = Image.asset('assets/temporary/profile_picture.png');
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? _image!.image
                        : AssetImage('assets/temporary/profile_picture.png') as ImageProvider,
                    child: _image == null
                        ? Icon(Icons.camera_alt, size: 50, color: Colors.indigo)
                        : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vault Name'),
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Days Remaining'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _daysRemaining = int.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Goal Amount'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _goalAmount = double.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newVault = Vault.parameterized(
                        name: _name,
                        image: _image!,
                        daysRemaining: _daysRemaining,
                        goalAmount: _goalAmount,
                        balanceAmount: 0.0,
                        cardLinkedId: 0,
                        isLocked: false,
                      );
                      Provider.of<Overall>(context, listen: false).setListVaults(
                        [...Provider.of<Overall>(context, listen: false).getListVaults(), newVault],
                      );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Vault added successfully')),
                      );
                    }
                  },
                  child: Text('Add Vault'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}