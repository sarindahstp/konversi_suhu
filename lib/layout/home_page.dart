import 'package:flutter/material.dart';
import 'package:konversi_suhu/widget/result_celcius_farenheit.dart';
import 'package:konversi_suhu/widget/result_kelvin_reamur.dart';
import 'package:konversi_suhu/widget/input_widget.dart';

import '../widget/identity_wigget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputUser = TextEditingController();

  double _celcius = 0;
  double _fahrenheit = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void temperatureConversion() {
    setState(() {
      _celcius = double.parse(_inputUser.text);
      _fahrenheit = (_celcius * (9 / 5)) + 32;
      _reamur = (4 / 5) * _celcius;
      _kelvin = _celcius + 273.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IdentityWidget(),
            InputWidget(inputUser: _inputUser),
            ResultCelciusFahrenheit(celcius: _celcius, fahrenheit: _fahrenheit),
            ResultKelvinReamur(kelvin: _kelvin, reamur: _reamur),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  temperatureConversion();
                },
                child: const Text(
                  'Konversi Suhu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
