import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      shape: const Border(
        bottom: BorderSide(
            color: Color.fromARGB(255,63, 83, 107),
            width: 0.5
        ),
      ),
      color: const Color.fromARGB(255,  37, 43, 48),
      child: ListTile(
        // contentPadding: EdgeInsets.all(0),
        // shape: Border(
        //   bottom: BorderSide(width: 0, color: Colors.grey),
        //   top: BorderSide(width: 0, color: Colors.grey),
        // ),
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 57, 63),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(
            image: AssetImage(img),
            width: 50,
            height: 50,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color.fromARGB(255, 250, 235, 224),
                fontSize: 15,
              ),
            ),
            Text(
              count.toString(),
              style: const TextStyle(color: Color.fromARGB(255, 250, 235, 224),
                fontSize: 15,
              ),
            ),

          ],
        ),
        // isThreeLine: true,
        subtitle:            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text(
              'Кількість за добу',
              style:  TextStyle(color: Color.fromARGB(255, 116, 115, 122),
                fontSize: 15,
              ),
            ),
            Text(
              difference > 0 ?
              '+$difference':' $difference',
              style:   TextStyle(color:  difference > 0 ?Colors.green : Colors.white,
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
