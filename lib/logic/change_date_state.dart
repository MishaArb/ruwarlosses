part of 'change_date_bloc.dart';

@immutable
abstract class ChangeDateState {
  int? date;
  ChangeDateState([this.date]);
}

class ChangeDateInitiaState extends ChangeDateState {}

class ChangedDateState extends ChangeDateState {
  ChangedDateState(super.date);
}