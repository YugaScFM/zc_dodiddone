import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _weatherData = '';
  String _city = 'Москва'; // Default city

  Future<void> _getWeather() async {
    final apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$apiKey&units=metric&lang=ru';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _weatherData = response.body;
      });
    } else {
      print('Error fetching weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Введите город',
                ),
                onChanged: (value) {
                  setState(() {
                    _city = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _getWeather,
              child: const Text('Получить погоду'),
            ),
            const SizedBox(height: 20),
            if (_weatherData.isNotEmpty)
              WeatherInfoWidget(weatherData: _weatherData),
          ],
        ),
      ),
    );
  }
}

class WeatherInfoWidget extends StatelessWidget {
  final String weatherData;

  const WeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final weatherMap = jsonDecode(weatherData);
    final temp = weatherMap['main']['temp'].toStringAsFixed(1);
    final description = weatherMap['weather'][0]['description'];
    final city = weatherMap['name'];

    return Column(
      children: [
        Text(
          'Город: $city',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          'Температура: $temp °C',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Описание: $description',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
