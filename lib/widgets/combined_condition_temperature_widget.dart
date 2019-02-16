import 'package:af_weather/models/weather.dart';
import 'package:af_weather/widgets/temperature_widget.dart';
import 'package:af_weather/widgets/weather_condition_widget.dart';
import 'package:flutter/material.dart';

class CombinedConditionTemperatureWidget extends StatelessWidget {
  final Weather weather;

  const CombinedConditionTemperatureWidget({Key key, @required this.weather})
      : assert(null != weather),
        super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: WeatherConditionsWidget(condition: weather.condition),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TemperatureWidget(
                  temperature: weather.temp,
                  low: weather.minTemp,
                  high: weather.maxTemp,
                ),
              )
            ],
          ),
          Center(
            child: Text(
              weather.formattedCondition,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.green,
              ),
            ),
          )
        ],
      );
}
