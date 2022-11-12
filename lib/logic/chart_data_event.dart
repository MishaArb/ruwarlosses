part of 'chart_data_bloc.dart';

@immutable
abstract class ChartDataEvent {
  final List dataLosses;
  const ChartDataEvent(this.dataLosses);
}
class LoadDataEvent extends ChartDataEvent{
  const LoadDataEvent(super.dataLosses);
}
