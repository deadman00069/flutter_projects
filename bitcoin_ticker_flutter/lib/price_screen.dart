import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'USD';
  String displayBTC = '?';
  String displayETC = '?';
  String displayLTC = '?';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi('USD');
  }

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownList = [];
    for (String currency in currenciesList) {
      var newItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownList.add(newItems);
    }
    return dropDownList;
  }

  updateUi(String inWhich) async {
    try {
      var rateBTC = await coinData.getRate('BTC', inWhich);
      print(rateBTC);
      var rateETC = await coinData.getRate('ETC', inWhich);
      print(rateETC);
      var rateLTC = await coinData.getRate('LTC', inWhich);
      print(rateLTC);
      setState(() {
        displayBTC = rateBTC.toStringAsFixed(0);
        displayETC = rateETC.toStringAsFixed(0);
        displayLTC = rateLTC.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> cupertinoList() {
    List<Widget> lol = [];
    for (String i in currenciesList) {
      var newWidget = Text(i);
      lol.add(newWidget);
    }
    return lol;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[0]} = $displayBTC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[1]} = $displayETC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[2]} = $displayLTC $selectedCurrency',
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
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurrency,
              items: getDropDownItems(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                  updateUi(value);
                  //rate =  getRate();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}