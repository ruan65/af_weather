import 'package:af_weather/models/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const []]) : super(props);
}

class WeatherChangedEvent extends ThemeEvent {
  final WeatherCondition condition;

  WeatherChangedEvent({@required this.condition})
      : assert(null != condition),
        super([condition]);
}
