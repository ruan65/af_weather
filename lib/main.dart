import 'package:af_weather/bloc/weather_bloc.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:af_weather/repositories/weather_api_client.dart';
import 'package:af_weather/widgets/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

void main() {

  BlocSupervisor().delegate = SimpleBlockDelegate();

  runApp(App(
    weatherRepository: WeatherRepository(
        weatherApiClient: WeatherApiClient(
            httpClient: http.Client()) // injection is here
    ),
  ));
}

class App extends StatelessWidget {

  final WeatherRepository weatherRepository;

  const App({Key key, @required this.weatherRepository})
      : assert(null != weatherRepository),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Weather',
        home: WeatherWidget(),
      );
}


