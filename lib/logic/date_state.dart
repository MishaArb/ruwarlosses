part of 'date_bloc.dart';

@immutable
abstract class DateState {
  int date;

  void changeDate();

  DateState(this.date);
}

class DecDateState extends DateState {
  DecDateState(super.date);

  void changeDate() {
    if(date > 1){
      date--;
    }

  }
}

class IncDateState extends DateState {
  IncDateState(super.date);

  void changeDate() {
    date++;
  }
}
