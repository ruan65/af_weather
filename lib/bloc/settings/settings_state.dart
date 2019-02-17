import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum TemperatureUnit { F, C }

class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;

  SettingsState({@required this.temperatureUnit})
      : assert(null != temperatureUnit),
        super([temperatureUnit]);
}
