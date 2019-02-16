import 'package:af_weather/bloc/weathe_events.dart';
import 'package:af_weather/bloc/weather_bloc.dart';
import 'package:af_weather/bloc/weather_state.dart';
import 'package:af_weather/repositories/WeatherRepository.dart';
import 'package:af_weather/widgets/city_selection_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Find your weather'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CitySelectionWidget()),
                );
                if (null != city) {
                  _weatherBloc.dispatch(FetchWeatherEvent(city: city));
                }
              },
            )
          ],
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
                print('State is $state');
                final weather = state.weather;

                return ListView(
                  children: <Widget>[
                    Text('Loaded for: ${weather.location}'),
                    Text('weather: ${weather}'),

                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                        child: LocationWidget(location: weather.location),
                      ),
                    ),
                    Center(
                      child: LastUpdatedWidget(dateTime: weather.lastUpdated),
                    ),
//                    Padding(padding: EdgeInsets.symmetric(vertical: 50.0),
//                      child: ,)
                  ],
                );
              }
            },
          ),
        ),
      );
}
