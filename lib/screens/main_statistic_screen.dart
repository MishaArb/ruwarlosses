import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruwarlosses/screens/people_loss_chart_screen.dart';
import 'package:ruwarlosses/screens/ship_loss_chart_screen.dart';
import 'package:ruwarlosses/screens/tank_loss_chart_screen.dart';
import 'package:ruwarlosses/screens/tankers_loss_screen.dart';
import 'package:ruwarlosses/widgets/donate_widget.dart';
import 'package:ruwarlosses/widgets/loss_card_widget.dart';
import '../logic/chart_data_bloc.dart';
import '../logic/losses_data_bloc.dart';
import '../logic/change_date_bloc.dart';
import 'ads_loss_chart_screen.dart';
import 'airplane_loss_chart_screen.dart';
import 'art_loss_chart_screen.dart';
import 'bbm.dart';
import 'drone_loss_chart_screen.dart';
import 'helicopters_loss_chart_screen.dart';
import 'mlrs_loss_chart_screen.dart';

int indexDate =1;

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

  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.topRight,
            child: const Image(
              image: AssetImage('images/flag.png'),
              width: 40,
              height: 40,
            ),
          ),
          backgroundColor: const Color.fromARGB(255,  37, 43, 48),
          elevation: 0.0,
        ),

        backgroundColor: const Color.fromARGB(255,   37, 43, 48),
        body: BlocConsumer<LossesDataBloc, LossesDataState>(
            listener: (context, state) {
          if (state is LoadedLossesDataState?) {
            indexDate = state.listLosses[0].dataLosses.length - 1;
          }
        }, builder: (context, state) {
          return BlocBuilder<ChangeDateBloc, ChangeDateState>(
            builder: (context, stateTest) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                //  color: Color.fromARGB(255, 37, 36, 41),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Допомога армії',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 220, 198, 67),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child:  DonateWidget(),
                    ),
                    // const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Втрати росії ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 220, 198, 67),
                          ),
                        ),
                        state is LoadedLossesDataState
                            ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                    if(indexDate > 1){
                                        context.read<ChangeDateBloc>().add(DecrementDateEvent());
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Color.fromARGB(255, 220, 198, 67),
                                    ),
                                  ),
                                  Text(
                                    '${state.listLosses[0].dataLosses[indexDate]['at'].split('-').reversed.join('-')}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 220, 198, 67),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (indexDate < state.listLosses[0].dataLosses.length - 1) {
                                        context.read<ChangeDateBloc>().add(IncrementDateEvent());
                                      }
                                    },
                                    icon: Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: indexDate == state.listLosses[0].dataLosses.length - 1
                                            ? const Color.fromARGB(150, 220, 198, 67)
                                            : const Color.fromARGB(
                                                255, 220, 198, 67)),
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
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[0].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PeopleLossChartScreen()));
                          },child: LossCardWidget(img: 'images/meat.png', name: 'Особовий склад', count:state.listLosses[0].dataLosses[indexDate]['val'], difference: state.listLosses[0].dataLosses[indexDate]['val']- state.listLosses[0].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                                      onTap: () {
                                        context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[1].dataLosses));
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TankLossChartScreen()));
                                      },
                                      child: LossCardWidget(img: 'images/tank.png', name: 'Танки', count:state.listLosses[1].dataLosses[indexDate]['val'], difference: state.listLosses[1].dataLosses[indexDate]['val']- state.listLosses[1].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[2].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BBMLossChartScreen()));
                          },child: LossCardWidget(img: 'images/bmp.png', name: 'ББМ', count:state.listLosses[2].dataLosses[indexDate]['val'], difference: state.listLosses[2].dataLosses[indexDate]['val']- state.listLosses[2].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[3].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtLossChartScreen()));
                          },child: LossCardWidget(img: 'images/art_sistems.png', name: '${state.listLosses[3].title}', count:state.listLosses[3].dataLosses[indexDate]['val'], difference: state.listLosses[3].dataLosses[indexDate]['val']- state.listLosses[3].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[4].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MLRSLossChartScreen()));
                          },child: LossCardWidget(img: 'images/mlrs.png', name: '${state.listLosses[4].title}', count:state.listLosses[4].dataLosses[indexDate]['val'], difference: state.listLosses[4].dataLosses[indexDate]['val']- state.listLosses[4].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[5].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ADSLossChartScreen()));
                          },child: LossCardWidget(img: 'images/ads.png', name: '${state.listLosses[5].title}', count:state.listLosses[5].dataLosses[indexDate]['val'], difference: state.listLosses[5].dataLosses[indexDate]['val']- state.listLosses[5].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[6].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AirplaneLossChartScreen()));
                          },child: LossCardWidget(img: 'images/airplane.png', name:'${state.listLosses[6].title}', count:state.listLosses[6].dataLosses[indexDate]['val'], difference: state.listLosses[6].dataLosses[indexDate]['val']- state.listLosses[6].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[7].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HelicoptersLossChartScreen()));
                          },child: LossCardWidget(img: 'images/helicopters.png', name: '${state.listLosses[7].title}', count:state.listLosses[7].dataLosses[indexDate]['val'], difference:state.listLosses[7].dataLosses[indexDate]['val']- state.listLosses[7].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[8].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DroneLossChartScreen()));
                          },child: LossCardWidget(img: 'images/drone.png', name: '${state.listLosses[8].title}', count:state.listLosses[8].dataLosses[indexDate]['val'], difference:state.listLosses[8].dataLosses[indexDate]['val']- state.listLosses[8].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[9].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShipLossChartScreen()));
                          },child: LossCardWidget(img: 'images/warship.png', name: '${state.listLosses[9].title}', count:state.listLosses[9].dataLosses[indexDate]['val'], difference:state.listLosses[9].dataLosses[indexDate]['val']- state.listLosses[9].dataLosses[indexDate-1]['val'],)),
                      GestureDetector(
                          onTap: () {
                            context.read<ChartDataBloc>().add(LoadDataEvent( state.listLosses[10].dataLosses));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TankersLossChartScreen()));
                          },child: LossCardWidget(img: 'images/vehi_tankers.png', name: '${state.listLosses[10].title}', count:state.listLosses[10].dataLosses[indexDate]['val'], difference:state.listLosses[10].dataLosses[indexDate]['val']- state.listLosses[10].dataLosses[indexDate-1]['val'],)),
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
