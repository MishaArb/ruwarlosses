import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
import '../logic/chart_data_bloc.dart';
import '../logic/losses_data_bloc.dart';
import '../widgets/chart_widget.dart';


class MLRSLossChartScreen extends StatelessWidget {
  const MLRSLossChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double heightWithoutappBarNavBar = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight + kBottomNavigationBarHeight);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color.fromARGB(255, 235, 241, 235)),
        centerTitle: true,
        title:  Text(S.of(context).mlrs, style: TextStyle(color:Color.fromARGB(255, 235, 241, 235)),),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255,   37, 43, 48),
      ),
      backgroundColor: const Color.fromARGB(255,   37, 43, 48),
      body: BlocBuilder<LossesDataBloc, LossesDataState>(
        builder: (context, state) {
          return BlocBuilder<ChartDataBloc, ChartDataState>(
            builder: (context, stateCD) {
              return Stack(
                children: [
                  Align(
                    alignment: const Alignment(-1, -0.0,),
                    child: Container(
                      margin: const EdgeInsets.only(left: 40),
                      width: size.width,
                      height: heightWithoutappBarNavBar,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 1, color: Color.fromARGB(255, 195, 195, 170)),
                          bottom: BorderSide(width: 1, color: Color.fromARGB(255, 195, 195, 170)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.listLosses[0].dataLosses.length - 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ChartWidget(
                          // Використовував .reversed.toList() для того щоб список починався з кінця
                           stateCD.dataLosses!.reversed.toList()[index].toDouble(),
                            state.listLosses[0].dataLosses.reversed.toList()[index + 1]['at'],
                            heightWithoutappBarNavBar,
                            stateCD.maxValue!);
                      },
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-1,0,),
                    child: Container(
                      width: 39.9,
                      height: heightWithoutappBarNavBar,
                      color: const Color.fromARGB(255,   37, 43, 48),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 28,
                            endIndent: 0,
                            color: Color.fromARGB(255, 135, 128, 103),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 28,
                            endIndent: 0,
                            color: Color.fromARGB(255, 135, 128, 103),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 28,
                            endIndent: 0,
                            color: Color.fromARGB(255, 135, 128, 103),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 28,
                            endIndent: 0,
                            color: Color.fromARGB(255, 135, 128, 103),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-1.01,-0.0,
                    ),
                    child: Container(
                      width: 34,
                      height:  heightWithoutappBarNavBar,
                      color: const Color.fromARGB(255,   37, 43, 48),
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text('${stateCD.maxValue!}', style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 135, 128, 103)),),
                          Text('${(stateCD.maxValue!*0.66).round()}', style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 135, 128, 103)),),
                          Text('${(stateCD.maxValue!*0.33).round()}', style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 135, 128, 103)),),
                          const Text('0', style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 135, 128, 103)),),
                        ],
                      ),
                    ),
                  ),

                ],
              );
            },
          );
        },
      ),
    );
  }
}




