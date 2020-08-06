import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
       var weatherData=jsonDecode(data);
      return weatherData;
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getCurrentCityData() async{
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String cityData = response.body;
      var weatherData=jsonDecode(cityData);
      return weatherData;
    } else {
      print(response.statusCode);
    }
  }
}
