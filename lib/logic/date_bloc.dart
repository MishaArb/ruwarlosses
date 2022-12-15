
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../main_statistic_screen.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState>  {
  DateBloc() : super(DecDateState(0)) {


    on<DecDateEvent>((event, emit) {
      emit(DecDateState(state.date)..changeDate());

    });
    on<IncDateEvent>((event, emit) {
      emit(IncDateState(state.date)..changeDate());
    });
  }
}
