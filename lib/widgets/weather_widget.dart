import 'dart:async';

import 'package:af_weather/bloc/theme/theme_bloc.dart';
import 'package:af_weather/bloc/theme/theme_state.dart';
import 'package:af_weather/bloc/weather/weather_bloc.dart';
import 'package:af_weather/bloc/weather/weather_events.dart';
import 'package:af_weather/bloc/weather/weather_state.dart';
import 'package:af_weather/models/weather.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:af_weather/widgets/city_selection_widget.dart';
import 'package:af_weather/widgets/combined_condition_temperature_widget.dart';
import 'package:af_weather/widgets/gradient_container_widget.dart';
import 'package:af_weather/widgets/last_updated_widget.dart';
import 'package:af_weather/widgets/location_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherWidget extends StatefulWidget {
  final WeatherRepository weatherRepository;

  const WeatherWidget({Key key, this.weatherRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  WeatherBloc _weatherBloc;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Find your weather'),
          actions: <Widget>[weatherIcon(context, _weatherBloc)],
        ),
        body: Center(
          child: BlocBuilder(
            bloc: _weatherBloc,
            builder: (_, WeatherState state) {
              if (state is WeatherEmptyState) {
                return Center(child: Text('Please Select a Location'));
              }
              if (state is WeatherLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is WeatherLoadedState) {
                final weather = state.weather;
                final themeBloc = BlocProvider.of<ThemeBloc>(context);

                _refreshCompleter?.complete();
                _refreshCompleter = Completer();

                return BlocBuilder(
                  bloc: themeBloc,
                  builder: (_, ThemeState themeState) =>
                      GradientContainerWidget(
                        color: themeState.color,
                        child: RefreshIndicator(
                          onRefresh: () {
                            _weatherBloc.dispatch(RefreshWeatherEvent(
                                city: state.weather.location));
                            return _refreshCompleter.future;
                          },
                          child: weatherDisplay(weather),
                        ),
                      ),
                );
              }

              if (state is WeatherErrorState) {
                return Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                );
              }
            },
          ),
        ),
      );
}

Widget weatherDisplay(Weather weather) => ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Center(
            child: LocationWidget(location: weather.location),
          ),
        ),
        Center(
          child: LastUpdatedWidget(dateTime: weather.lastUpdated),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: CombinedConditionTemperatureWidget(weather: weather))
      ],
    );

Widget weatherIcon(BuildContext ctx, WeatherBloc bloc) => IconButton(
      icon: Icon(Icons.search),
      onPressed: () async {
        final city = await Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => CitySelectionWidget()),
        );
        if (null != city) {
          bloc.dispatch(FetchWeatherEvent(city: city));
        }
      },
    );
