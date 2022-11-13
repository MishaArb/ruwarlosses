import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateWidget extends StatelessWidget {
   DonateWidget({
    Key? key,
  }) : super(key: key);

   Future<void> _launchUrl({required Uri uri}) async {
     if (await canLaunchUrl(uri)) {
       throw 'Could not launch $uri';
     }

     await launchUrl(uri);
   }
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: GestureDetector(
          onTap: ()=> _launchUrl(uri: Uri.parse('https://markusfoundation.com/')),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 48, 51, 57),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Image(image: AssetImage('images/markus.png')),
          ),
        ),
      ),
      const SizedBox(width: 10,),

      Expanded(
        child:  GestureDetector(
          onTap: ()=> _launchUrl(uri: Uri.parse('https://savelife.in.ua/')),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10),

            ),
            child: const Image(image: AssetImage('images/back_alive.png')),
          ),
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
          child:  GestureDetector(
            onTap: ()=> _launchUrl(uri: Uri.parse('https://prytulafoundation.org/')),
            child: Container(
             height: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 239, 244, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Image(image: AssetImage('images/prytula.png')),
        ),
          ),
      ),
    ],);
  }
}