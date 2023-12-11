import 'dart:convert';
import 'package:g6weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<WeatherModel?> getWeatherData() async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=cusco&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }
    return null;
  }
}
