import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class FetchWeatherEvent extends WeatherEvent {
  final String city;

  FetchWeatherEvent({@required this.city})
      : assert(city != null),
        super([city]);
}
