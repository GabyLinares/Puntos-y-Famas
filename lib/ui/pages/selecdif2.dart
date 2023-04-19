import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcialgabrielalinares/ui/pages/versusd.dart';
import 'package:parcialgabrielalinares/ui/pages/versusf.dart';
import 'package:parcialgabrielalinares/ui/pages/versusn.dart';
import '../controllers/game_controller.dart';

class menuSeleccionDifVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final GameController gameController = Get.put(GameController());
    final GameController gameController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de dificultad'),
      ),
      body:

          // AGREGAR TEXTO DE SELECCION DE DIF
          Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Fácil (3 dígitos)'),
              onPressed: () {
                Get.to(() => VersusF());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Center(
              child: ElevatedButton(
                  child: const Text('Normal (4 dígitos)'),
                  onPressed: () {
                    Get.to(() => VersusN());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ))),
          Center(
              child: ElevatedButton(
                  child: const Text('Dificil (5 dígitos)'),
                  onPressed: () {
                    Get.to(() => VersusD());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ))),
        ],
      ),
    );
  }
}

//TextField(
  //                        keyboardType: TextInputType.number,
    //                      inputFormatters: [
      //                      FilteringTextInputFormatter.digitsOnly,
        //                    LengthLimitingTextInputFormatter(1),
          //                ],
            //            ),
