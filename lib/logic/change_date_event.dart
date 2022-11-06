part of 'change_date_bloc.dart';

@immutable
abstract class ChangeDateEvent {}
class DecrementDateEvent extends ChangeDateEvent {}
class IncrementDateEvent extends ChangeDateEvent {}
