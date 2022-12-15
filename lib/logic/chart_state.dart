part of 'chart_bloc.dart';

@immutable
abstract class ChartState {
  List dataLosses;
  List eventDataLosses;
  int maxValue;
  void getDataLoss();
  ChartState(this.dataLosses,  this.eventDataLosses, this.maxValue,);
}


class LoadedChartState extends ChartState {
  LoadedChartState(super.dataLosses,  super.eventDataLosses, super.maxValue,);
  @override
  void getDataLoss() async{
    dataLosses = [];
    for(var i = 1; i< eventDataLosses.length; i++){
      // Помилки в json (напр 16.07.22 val - 0, хоча вже 17.07.22 - 119) тому потрібно було писати таку херню щоб правильно відображався графік
      dataLosses.add(
          (eventDataLosses[i]['val'] - eventDataLosses[i-1]['val']).isNegative ? 0
              : eventDataLosses[i-1]['val'] == 0 && eventDataLosses[i-1]['val'] < eventDataLosses[i]['val'] ? 0 :
          eventDataLosses[i]['val'] - eventDataLosses[i-1]['val']
      );
    }
      maxValue = dataLosses.reduce((curr, next) => curr > next? curr: next);
        }

}
