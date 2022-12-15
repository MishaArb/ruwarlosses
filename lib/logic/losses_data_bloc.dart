import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'losses_model.dart';

part 'losses_data_event.dart';
part 'losses_data_state.dart';

class LossesDataBloc extends Bloc<LossesDataEvent, LossesDataState> {
  LossesDataBloc() : super(LoadingLossesDataState([])) {
    on<LoadLossesDataEvent>((event, emit) async{
      List<String> url = [
       'https://uadata.net/ukraine-russia-war-2022/people.json',
       'https://uadata.net/ukraine-russia-war-2022/tanks.json',
       'https://uadata.net/ukraine-russia-war-2022/bbm.json',
       'https://uadata.net/ukraine-russia-war-2022/artilery.json',
       'https://uadata.net/ukraine-russia-war-2022/rszv.json',
       'https://uadata.net/ukraine-russia-war-2022/ppo.json',
       'https://uadata.net/ukraine-russia-war-2022/planes.json',
       'https://uadata.net/ukraine-russia-war-2022/helicopters.json',
       'https://uadata.net/ukraine-russia-war-2022/bpla.json',
       'https://uadata.net/ukraine-russia-war-2022/ships.json',
        'https://uadata.net/ukraine-russia-war-2022/auto.json',
      ];
      List<LossesModel> responseUrl = [];
      for(var i = 0; i < url.length; i++){
        http.Response response = await http.get(Uri.parse(url[i]));

        if (response.statusCode == 200) {
          responseUrl.add(LossesModel.fromJson(jsonDecode(response.body)));
        }
      }
      // Добавив дані за дні які відсутні в json (артилерія, рсзв, ппо)
      responseUrl[3].dataLosses.insertAll(0, [{'at': '2022-02-27', 'val': 49}, {'at': '2022-02-28', 'val': 74},]);
      responseUrl[4].dataLosses.insertAll(0, [{'at': '2022-02-27', 'val': 4}, {'at': '2022-02-28', 'val': 21},]);
      responseUrl[5].dataLosses.insertAll(0, [{'at': '2022-02-27', 'val': 1},]);

      emit(LoadedLossesDataState( responseUrl));

    });
  }
}
