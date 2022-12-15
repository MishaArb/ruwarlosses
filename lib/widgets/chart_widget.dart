import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/chart_bloc.dart';
class ChartWidget extends StatefulWidget {
  const ChartWidget(this.index, this.date, this.heightChart, this.max);
  final double index;
  final String date;
  final double heightChart;
  final int max;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  double getHeightColumn(double heightChart, int max, double index){
    if(index == max){
      return heightChart;
    } else {
      double a =( index / max) * 100;
      double b =  (a * heightChart)/ 100;
      return b;
    }
  }

  bool prompt = false;

  void hidePrompt() {
    setState(() {
      prompt = true;
    });
  }

  void showPrompt() {
    setState(() {
      prompt = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartBloc, ChartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTapUp: (a){
                showPrompt();
              },
              onTapDown: (a){
                hidePrompt();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: prompt,
                    child: Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 20,
                      // color: Colors.red,
                      child: Text('${widget.index.toInt()}', style: const TextStyle(color: Color.fromARGB(255, 135, 128, 103), fontSize: 15)),
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Container(
                    width: 20,
                    height: getHeightColumn(widget.heightChart, widget.max,  widget.index),
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)
                      ),
                      color: Color.fromARGB(255, 60, 152, 89),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            RotationTransition(turns: const AlwaysStoppedAnimation(-25 / 360),
                child: Text(widget.date.split('-').reversed.join('-'), style: const TextStyle(color: Color.fromARGB(255, 135, 128, 103), fontSize: 8),)),
            const SizedBox(height: 10,)
          ],
        );
      },
    );
  }
}