import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {

  final WeatherRepository weatherRepository;

  const WeatherWidget({Key key, this.weatherRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(title: Text('Find your weather')),
        body: Text('tmp'),
      );
}