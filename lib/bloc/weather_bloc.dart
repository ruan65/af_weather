import 'package:af_weather/bloc/weathe_events.dart';
import 'package:af_weather/bloc/weather_state.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

      }
    }
  }
}
