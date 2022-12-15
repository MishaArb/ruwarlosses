
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(LoadedChartState(const [], const [],1  )) {
    on<LoadChartEvent>((event, emit) {
      emit(LoadedChartState( state.dataLosses,  event.dataLosses, state.maxValue)..getDataLoss());
    });
  }
}
