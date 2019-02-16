import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:af_weather/models/weather.dart';

abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {

  final Weather weather;

  WeatherLoadedState({@required this.weather})
      : assert(weather != null),
        super([weather]);
}

class WeatherErrorState extends WeatherState {}
