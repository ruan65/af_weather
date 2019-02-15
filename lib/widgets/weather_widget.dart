import 'package:af_weather/bloc/weather_bloc.dart';
import 'package:af_weather/bloc/weather_state.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
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

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(title: Text('Find your weather')),
        body: Center(
          child: BlocBuilder(
            bloc: _weatherBloc,
            builder: (_, WeatherState state) {
              if(state is WeatherEmptyState) {
                return Center(child: Text('Please Select a Location'));
              }
              if(state is WeatherLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if(state is WeatherLoadedState) {

                final weather = state.weather;

                return ListView(
                  children: <Widget>[

                  ],
                );
              }
            },
          ),
        ),
      );
}