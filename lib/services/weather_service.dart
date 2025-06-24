// import 'dart:convert';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:http/http.dart' as http;

// class WeatherService {
//   static const BASE_URL = "http://api.openweathermap.org/data/2.5/forecast";
//   final String apiKey;

//   WeatherService(this.apiKey);

//   Future<WeatherModel> getWeather(String cityName) async {
//     final response = await http
//         .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

//     if (response.statusCode == 200) {
//       return WeatherModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }

//   Future<String> getCurrentCity() async {
//     //get permission to access location
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }

//     // fetch the current location
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     // convert the location into a list of placemarks objects
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);

//     // extract the city name from the first placemarks
//     String? city = placemarks[0].locality;
//     return city ?? "";
//   }
// }

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/forecast";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather(String cityName) async {
    // Simulate a delay to mimic network request
    await Future.delayed(Duration(seconds: 2));

    // Return dummy weather data
    return _getDummyWeatherData(cityName);
  }

  Future<String> getCurrentCity() async {
    // Simulate a delay to mimic network request
    await Future.delayed(Duration(seconds: 1));

    // Return a dummy city name
    return "New York";
  }

  // Helper method to generate dummy weather data
  WeatherModel _getDummyWeatherData(String cityName) {
    return WeatherModel(
      cityName: cityName,
      temperature: 25.0, // Dummy temperature in Celsius
      mainCondition: "Clear", // Dummy weather condition
    );
  }
}
