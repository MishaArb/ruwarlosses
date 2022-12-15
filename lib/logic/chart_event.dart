part of 'chart_bloc.dart';

@immutable
abstract class ChartEvent {
  final List dataLosses;
  const ChartEvent(this.dataLosses);
}
class LoadChartEvent extends ChartEvent{
  const LoadChartEvent(super.dataLosses);
}
