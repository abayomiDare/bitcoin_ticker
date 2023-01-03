import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late String selectedCurrency = 'USD';
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> menuItem = [];

    for (String currency in currenciesList) {
      var currencyVal = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      menuItem.add(currencyVal);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: menuItem,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
          });
        });
  }

  CupertinoPicker iosDropDown() {
    List<Text> menuItem = [];

    for (String currency in currenciesList) {
      menuItem.add(Text(currency));
    }

    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: menuItem);
  }

  Widget getPicker() {
    if (Platform.isAndroid) {
      return androidDropDown();
    } else {
      return iosDropDown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
