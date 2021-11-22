import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '67e656e68cd133cf885aab07b2c25307';
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/find';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    
    NetworkHelper networkHelper = NetworkHelper('$weatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = networkHelper.getData();

    return weatherData;

  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper('$weatherMapURL?lat=${location.lat}&lon=${location.long}&cnt=10&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}