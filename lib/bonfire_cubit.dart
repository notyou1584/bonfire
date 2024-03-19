import 'package:flutter_bloc/flutter_bloc.dart';

// Define the states
abstract class StrollBonfireState {}

class StrollBonfireOptionSelected extends StrollBonfireState {
  final String selectedOption;

  StrollBonfireOptionSelected(this.selectedOption);
}

// Define the events
abstract class StrollBonfireEvent {}

class StrollBonfireOptionSelectedEvent extends StrollBonfireEvent {
  final String selectedOption;

  StrollBonfireOptionSelectedEvent(this.selectedOption);
}

// Define the cubit
class StrollBonfireCubit extends Cubit<StrollBonfireState> {
  StrollBonfireCubit() : super(StrollBonfireOptionSelected(''));

  void selectOption(String option) {
    emit(StrollBonfireOptionSelected(option));
  }
}
