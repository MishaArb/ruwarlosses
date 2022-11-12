part of 'chart_data_bloc.dart';

@immutable
abstract class ChartDataState {
   List? dataLosses;
   int? maxValue;
  ChartDataState( [this.dataLosses, this.maxValue]);

}

class ChartDataInitState extends ChartDataState {}
class LoadedDataState extends ChartDataState {
 LoadedDataState(super.dataLosses, super.maxValue) ;
}
