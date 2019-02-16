import 'package:af_weather/models/weather.dart';
import 'package:af_weather/widgets/weather_condition_widget.dart';
import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {

  final Weather weather;

  const TemperatureWidget({Key key, @required this.weather})
      : assert(null != weather),
        super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: WeatherConditionsWidget(condition: weather.condition),
          )
        ],
      );
}
