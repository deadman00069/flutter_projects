import 'package:http/http.dart' as http;
import 'dart:convert';

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

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '?apikey=A2506894-6599-4228-AAD5-C53E84220D12';
//4D24F4D0-D10C-4262-9D74-BBD31E67D772
class CoinData {
//  CoinData(this.inWhich, this.whtExchange);
//
//  String whtExchange;
//  String inWhich;

  Future getRate(String whtExchange, String inWhich) async {
    http.Response response =
        await http.get(url + '/' + whtExchange + '/' + inWhich + apiKey);
    if (response.statusCode == 200) {
      var getRate = response.body;
      var rateDetails = jsonDecode(getRate);
      return rateDetails['rate'];
    }
    else{
      return response.statusCode;
    }
  }
}
