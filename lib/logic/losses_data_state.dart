part of 'losses_data_bloc.dart';

@immutable
abstract class LossesDataState {
  var listLosses;
  LossesDataState([this.listLosses]);
}

class LoadingLossesDataState extends LossesDataState {}
class LoadedLossesDataState extends LossesDataState {
  LoadedLossesDataState( super.listLosses);
}


