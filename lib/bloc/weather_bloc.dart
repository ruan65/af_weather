import 'dart:async';

import 'package:af_weather/bloc/weathe_events.dart';
import 'package:af_weather/bloc/weather_state.dart';
import 'package:af_weather/models/weather.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SimpleBlockDelegate extends BlocDelegate {

  @override
  void onTransition(Transition transition) {
    print(transition);
  }
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmptyState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherState currentState,
    WeatherEvent event,
  ) async* {

    if(event is FetchWeatherEvent) {

      yield WeatherLoadingState();

      try {

        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadedState(weather: weather);

      } catch (_) {
        yield WeatherErrorState();
      }
    }

    if(event is RefreshWeatherEvent) {
      try {

        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadedState(weather: weather);

      } catch (_) {
        yield currentState;
      }
    }
  }
}
