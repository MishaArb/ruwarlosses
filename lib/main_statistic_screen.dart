import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruwarlosses/chart_screens/people_loss_chart_screen.dart';
import 'package:ruwarlosses/chart_screens/ship_loss_chart_screen.dart';
import 'package:ruwarlosses/chart_screens/tank_loss_chart_screen.dart';
import 'package:ruwarlosses/chart_screens/tankers_loss_screen.dart';
import 'package:ruwarlosses/widgets/donate_widget.dart';
import 'package:ruwarlosses/widgets/loss_card_widget.dart';
import 'generated/l10n.dart';
import 'logic/chart_bloc.dart';
import 'logic/losses_data_bloc.dart';
import 'logic/date_bloc.dart';
import 'chart_screens/ads_loss_chart_screen.dart';
import 'chart_screens/airplane_loss_chart_screen.dart';
import 'chart_screens/art_loss_chart_screen.dart';
import 'chart_screens/bbm.dart';
import 'chart_screens/drone_loss_chart_screen.dart';
import 'chart_screens/helicopters_loss_chart_screen.dart';
import 'chart_screens/mlrs_loss_chart_screen.dart';


class MainStatisticScreen extends StatefulWidget {
  const MainStatisticScreen({Key? key}) : super(key: key);

  @override
  State<MainStatisticScreen> createState() => _MainStatisticScreenState();
}

class _MainStatisticScreenState extends State<MainStatisticScreen>  with WidgetsBindingObserver{

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(state == AppLifecycleState.resumed){
      context.read<LossesDataBloc>().add(LoadLossesDataEvent());
    }
    super.didChangeAppLifecycleState(state);
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<LossesDataBloc>().add(LoadLossesDataEvent());
    countDaysWar();

  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  late int dayOfWar;

  void countDaysWar() {
    var from = DateTime(2022, 02, 23);
    var to = DateTime.now();
    setState(() {
      dayOfWar = to.difference(from).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text('$dayOfWar ДЕНЬ ВІЙНИ',style: const TextStyle(color: Color.fromARGB(255, 1, 91, 187)),),
              const Image(
                image: AssetImage('images/flag.png'),
                width: 40,
                height: 40,
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255,  37, 43, 48),
          elevation: 0.0,
        ),

        backgroundColor: const Color.fromARGB(255,   37, 43, 48),
        body: BlocConsumer<LossesDataBloc, LossesDataState>(
            listener: (context, state) {
              if (state is LoadedLossesDataState?) {
               BlocProvider.of<DateBloc>(context).state.date =state.listLosses[0].dataLosses.length - 1;
               }
            }, builder: (context, state) {
          return BlocBuilder<DateBloc, DateState>(
            builder: (context, stateDate) {
                          return Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                //  color: Color.fromARGB(255, 37, 36, 41),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:  Text(
                        S.of(context).helpArmy,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 254, 208, 0)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 25, bottom: 10),
                      child:  DonateWidget(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          S.of(context).ruLosses,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 254, 208, 0)
                          ),
                        ),
                        state is LoadedLossesDataState
                            ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                     context.read<DateBloc>().add(DecDateEvent());
                                    },
                                    icon: const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Color.fromARGB(255, 254, 208, 0)
                                    ),
                                  ),
                                  Text(
                                    '${state.listLosses[0].dataLosses[stateDate.date]['at'].split('-').reversed.join('-')}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 254, 208, 0)
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (stateDate.date < state.listLosses[0].dataLosses.length - 1) {
                                        context.read<DateBloc>().add(IncDateEvent());
                                      }
                                    },
                                    icon: Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: stateDate.date == state.listLosses[0].dataLosses.length - 1
                                            ? const Color.fromARGB(150, 220, 198, 67)
                                            : const Color.fromARGB(255, 254, 208, 0)),
                                  ),
                                ],
                ) :const SizedBox(),
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child:
              state is LoadedLossesDataState ?
              ListView(
                    children: [
                      GestureDetector(
                          onTap: (){
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[0].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PeopleLossChartScreen()));
                          },child: LossCardWidget(img: 'images/meat.png', name: S.of(context).personnel, count:state.listLosses[0].dataLosses[stateDate.date]['val'], difference: state.listLosses[0].dataLosses[stateDate.date]['val']- state.listLosses[0].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[1].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TankLossChartScreen()));
                          },
                                      child: LossCardWidget(img: 'images/tank.png', name: S.of(context).tanks, count:state.listLosses[1].dataLosses[stateDate.date]['val'], difference: state.listLosses[1].dataLosses[stateDate.date]['val']- state.listLosses[1].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[2].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BBMLossChartScreen()));
                            // Помилка в загальній кількості втрат і також неправильно був підрахунок втрат за добу. Виправив додавши до indexDate+2
                          },child: LossCardWidget(img: 'images/bmp.png', name: S.of(context).bbm, count:state.listLosses[2].dataLosses[stateDate.date+2]['val'], difference: state.listLosses[2].dataLosses[stateDate.date+2]['val']- state.listLosses[2].dataLosses[stateDate.date+1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[3].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtLossChartScreen()));
                          },child: LossCardWidget(img: 'images/art_sistems.png', name: S.of(context).artillery, count:state.listLosses[3].dataLosses[stateDate.date]['val'], difference: state.listLosses[3].dataLosses[stateDate.date]['val']- state.listLosses[3].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[4].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MLRSLossChartScreen()));
                          },child: LossCardWidget(img: 'images/mlrs.png', name: S.of(context).mlrs, count:state.listLosses[4].dataLosses[stateDate.date]['val'], difference: state.listLosses[4].dataLosses[stateDate.date]['val']- state.listLosses[4].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[5].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ADSLossChartScreen()));
                          },child: LossCardWidget(img: 'images/ads.png', name: S.of(context).ads, count:state.listLosses[5].dataLosses[stateDate.date]['val'], difference: state.listLosses[5].dataLosses[stateDate.date]['val']- state.listLosses[5].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[6].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AirplaneLossChartScreen()));
                          },child: LossCardWidget(img: 'images/airplane.png', name: S.of(context).aircrafts, count:state.listLosses[6].dataLosses[stateDate.date]['val'], difference: state.listLosses[6].dataLosses[stateDate.date]['val']- state.listLosses[6].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[7].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HelicoptersLossChartScreen()));
                          },child: LossCardWidget(img: 'images/helicopters.png', name: S.of(context).helicopters, count:state.listLosses[7].dataLosses[stateDate.date]['val'], difference:state.listLosses[7].dataLosses[stateDate.date]['val']- state.listLosses[7].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[8].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DroneLossChartScreen()));
                          },child: LossCardWidget(img: 'images/drone.png', name: S.of(context).drone, count:state.listLosses[8].dataLosses[stateDate.date]['val'], difference:state.listLosses[8].dataLosses[stateDate.date]['val']- state.listLosses[8].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[9].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShipLossChartScreen()));
                          },child: LossCardWidget(img: 'images/warship.png', name:  S.of(context).ship, count:state.listLosses[9].dataLosses[stateDate.date]['val'], difference:state.listLosses[9].dataLosses[stateDate.date]['val']- state.listLosses[9].dataLosses[stateDate.date-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartBloc>().add(LoadChartEvent( state.listLosses[10].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TankersLossChartScreen()));
                          },child: LossCardWidget(img: 'images/vehi_tankers.png', name: S.of(context).tankers, count:state.listLosses[10].dataLosses[stateDate.date]['val'], difference:state.listLosses[10].dataLosses[stateDate.date]['val']- state.listLosses[10].dataLosses[stateDate.date-1]['val'],)),
                    ],
              ) :  const Center(child: CircularProgressIndicator())
             ),
          ],
        ),
      );
  },
);
  }
)

    );
  }
}
