import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:intl/intl.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String weatherIcon;
  var cityName;
  String time;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        cityName = 'No data';
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      print(condition);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      print(weatherModel.getWeatherIcon(condition));
      cityName = weatherData['name'];
    });
  }

  void getTime() {
    var now = new DateTime.now();
    var newDt = DateFormat.MMMMEEEEd().format(now);
    time = newDt;
  }

  @override
  Widget build(BuildContext context) {
    getTime();
    return SafeArea(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/yellow.jpg',
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.my_location,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () async {
                    var weatherData = await weatherModel.getLocationWeather();
                    updateUi(weatherData);
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () async{
                      var cityName= await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return City();
                      }));
                      if(cityName != null)
                        {
                          var weatherData=await weatherModel.getCityWeather(cityName);
                          updateUi(weatherData);
                        }
                      print(cityName);
                    },
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/yellow.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                fontSize: 64,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              time ?? 'Wednesday, 15 July 2020 ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$temperature°',
                              style: TextStyle(
                                fontSize: 128,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  weatherIcon,
                                  style: TextStyle(fontSize: 64),
                                ),
                                Text(
                                  'Raining',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
