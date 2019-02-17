import 'package:af_weather/bloc/settings/settings_bloc.dart';
import 'package:af_weather/bloc/simple_bloc_delegate.dart';
import 'package:af_weather/bloc/theme/theme_bloc.dart';
import 'package:af_weather/bloc/theme/theme_state.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:af_weather/repositories/weather_api_client.dart';
import 'package:af_weather/widgets/weather_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor().delegate = SimpleBlockDelegate();

  runApp(App(
    weatherRepository: WeatherRepository(
        weatherApiClient:
            WeatherApiClient(httpClient: http.Client()) // injection is here
        ),
  ));
}

class App extends StatefulWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(null != weatherRepository),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeBloc _themeBloc = ThemeBloc();
  SettingsBloc _settingsBloc = SettingsBloc();

  @override
  Widget build(BuildContext context) => BlocProvider(
        bloc: _themeBloc,
        child: BlocProvider(
          bloc: _settingsBloc,
          child: BlocBuilder(
            bloc: _themeBloc,
            builder: (_, ThemeState themeState) => MaterialApp(
                  title: 'Weather',
                  theme: themeState.theme,
                  home: WeatherWidget(
                    weatherRepository: widget.weatherRepository,
                  ),
                ),
          ),
        ),
      );

  @override
  void dispose() {
    _themeBloc.dispose();
    _settingsBloc.dispose();
    super.dispose();
  }
}
