part of 'date_bloc.dart';

@immutable
abstract class DateEvent {}
class DecDateEvent extends DateEvent {}
class IncDateEvent extends DateEvent {}
