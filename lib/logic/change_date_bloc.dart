
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../main_statistic_screen.dart';

part 'change_date_event.dart';
part 'change_date_state.dart';

class ChangeDateBloc extends Bloc<ChangeDateEvent, ChangeDateState> {
  ChangeDateBloc() : super(ChangeDateInitiaState()) {


    on<DecrementDateEvent>((event, emit) {
        emit(ChangedDateState(state.date = indexDate-=1));
    });
    on<IncrementDateEvent>((event, emit) {
        emit(ChangedDateState(state.date = indexDate+=1));
    });
  }
}
