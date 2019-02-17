import 'dart:async';

import 'package:af_weather/bloc/settings/settings_events.dart';
import 'package:af_weather/bloc/settings/settings_state.dart';
import 'package:bloc/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState =>
      SettingsState(temperatureUnit: TemperatureUnit.C);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsState currentState,
    SettingsEvent event,
  ) async* {
    yield SettingsState(
        temperatureUnit: currentState.temperatureUnit == TemperatureUnit.C
            ? TemperatureUnit.F
            : TemperatureUnit.C);
  }
}
