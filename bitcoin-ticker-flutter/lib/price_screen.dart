import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'reusable_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String bitcoinValue = '?';
  String ethValue = '?';
  String ltcValue = '?';

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(
            () {
              selectedCurrency = value;
              getData();
            },
          );
        });
  }

  CupertinoPicker getIosPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  String getCryptoListItem(int index) {
    return cryptoList[index];
  }

  void getData() async {
    try {
      Map<String, String> coinValue =
          await CoinData().getCoinData(selectedCurrency);
      bitcoinValue = coinValue['BTC'];
      ethValue = coinValue['ETH'];
      ltcValue = coinValue['LTC'];
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('🤑 Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(
              cryptoCurrency: getCryptoListItem(0),
              selectedCurrency: selectedCurrency,
              currencyValue: bitcoinValue),
          ReusableCard(
              cryptoCurrency: getCryptoListItem(1),
              selectedCurrency: selectedCurrency,
              currencyValue: ethValue),
          ReusableCard(
              cryptoCurrency: getCryptoListItem(2),
              selectedCurrency: selectedCurrency,
              currencyValue: ltcValue),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIosPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}
