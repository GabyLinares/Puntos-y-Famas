import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcialgabrielalinares/ui/pages/tablerod.dart';
import 'package:parcialgabrielalinares/ui/pages/tablerof.dart';
import 'package:parcialgabrielalinares/ui/pages/tableron.dart';
import '../controllers/game_controller.dart';

class menuSeleccionDif extends StatelessWidget {
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
                Get.to(() => TableroF());
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
              Get.to(() => TableroN());
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
                    Get.to(() => TableroD());
                  },
                  style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),))),
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
