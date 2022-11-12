import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonateWidget extends StatelessWidget {
  const DonateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: const Color.fromARGB(255, 48, 51, 57),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Image(image: AssetImage('images/markus.png')),
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),

          ),
          child: const Image(image: AssetImage('images/back_alive.png')),
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
          child: Container(
           height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: const Color.fromARGB(255, 239, 244, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Image(image: AssetImage('images/prytula.png')),
        ),
      ),
    ],);
  }
}