import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Advice extends StatefulWidget {
  const Advice({Key? key}) : super(key: key);

  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
  String? _advice;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAdvice();
  }

  Future<void> _fetchAdvice() async {
    try {
      do{
        var response = await http.get(Uri.parse('https://api.adviceslip.com/advice'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['slip']['advice'].split(' ').length < 10){
            setState(() {
              _advice = data['slip']['advice'];
              _isLoading = false;
            });
          }
        } else {
          throw Exception('Failed to load advice');
        }
      } while(_advice == null); //constrain advice to be a certain word count

    } catch (e) {
      setState(() {
        _advice = 'Could not fetch advice. Please try again later.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return CircularProgressIndicator();
    }
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _advice!,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Poppins",
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}