import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_data_event.dart';
part 'chart_data_state.dart';

class ChartDataBloc extends Bloc<ChartDataEvent, ChartDataState> {
  ChartDataBloc() : super(ChartDataInitState()) {
    on<LoadDataEvent>((event, emit) {
      List<int> listLossByDay = [];

      for(var i = 1; i< event.dataLosses.length; i++){
        // Помилки в json (напр 16.07.22 val - 0, хоча вже 17.07.22 - 119) тому потрібно було писати таку херню щоб правильно відображавя графік
        listLossByDay.add(
            (event.dataLosses[i]['val'] - event.dataLosses[i-1]['val']).isNegative ? 0
                : event.dataLosses[i-1]['val'] == 0 && event.dataLosses[i-1]['val'] < event.dataLosses[i]['val'] ? 0 :
           event.dataLosses[i]['val'] - event.dataLosses[i-1]['val']

        );
      }
      emit(LoadedDataState( listLossByDay, listLossByDay.reduce(max)));
    });
  }
}
