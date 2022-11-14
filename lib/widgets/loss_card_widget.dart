import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class LossCardWidget extends StatelessWidget {
  const LossCardWidget({
    Key? key,
    required this.img,
    required this.name,
    required this.count,
    required this.difference,
  }) : super(key: key);
  final String img;
  final String name;
  final int count;
  final int difference;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255,  37, 43, 48),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        shape: const Border(
          bottom: BorderSide(width: 0, color: Color.fromARGB(255,  111, 115, 119)),
           ),

        dense: true,
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 57, 63),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image(
            image: AssetImage(img),
            width: 50,
            height: 60,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 241, 235),
                fontSize: 15,
              ),
            ),
            Text(
              count.toString(),
              style: const TextStyle(color: Color.fromARGB(255, 235, 241, 235),
                fontSize: 15,
              ),
            ),

          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
             Text(
              S.of(context).wuantityDay,
              style:  const TextStyle(color: Color.fromARGB(150, 135, 128, 103),
                fontSize: 15,
              ),
            ),
            Text(
              difference > 0 ?
              '+$difference':' $difference',
              style:   TextStyle(color:  difference > 0 ?const Color.fromARGB(255, 60, 152, 89) : const Color.fromARGB(255, 235, 241, 235),
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
