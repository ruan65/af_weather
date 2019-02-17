import 'package:af_weather/bloc/settings/settings_bloc.dart';
import 'package:af_weather/bloc/settings/settings_events.dart';
import 'package:af_weather/bloc/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder(
            bloc: settingsBloc,
            builder: (_, SettingsState state) => ListTile(
                  title: Text('Temperature Units'),
                  isThreeLine: true,
                  subtitle:
                      Text('Use metric measurements for temperature units.'),
                  trailing: Switch(
                    value: state.temperatureUnit == TemperatureUnit.C,
                    onChanged: (_) =>
                        settingsBloc.dispatch(TemperatureUnitsToggledEvent()),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
