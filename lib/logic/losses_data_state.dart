part of 'losses_data_bloc.dart';

@immutable
abstract class LossesDataState {
  List listLosses;
  LossesDataState(this.listLosses);
}

class LoadingLossesDataState extends LossesDataState {
  LoadingLossesDataState(super.listLosses);
}
class LoadedLossesDataState extends LossesDataState {
  LoadedLossesDataState( super.listLosses);
}


