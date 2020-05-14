import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = '51BEF403-E3CC-4531-B516-D17B2829A592';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> coinValue = {};
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get('$baseUrl/$crypto/$selectedCurrency?apikey=$apikey');
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        coinValue[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return coinValue;
  }
}
