// stroll_bonfire_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class StrollBonfireCubit extends Cubit<StrollBonfireState> {
  StrollBonfireCubit()
      : super(StrollBonfireInitial()); // Initial state without option

  void selectOption(String option) {
    emit(StrollBonfireOptionSelected(option));
  }
}

abstract class StrollBonfireState {}

class StrollBonfireInitial extends StrollBonfireState {}

class StrollBonfireOptionSelected extends StrollBonfireState {
  final String selectedOption;

  StrollBonfireOptionSelected(this.selectedOption);
}
