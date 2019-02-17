import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {}

class TemperatureUnitsToggledEvent extends SettingsEvent {}
