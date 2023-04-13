import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcialgabrielalinares/ui/pages/selecdif.dart';
import '../controllers/game_controller.dart';
import 'package:parcialgabrielalinares/ui/pages/versus.dart';

class menuSeleccionModo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final GameController gameController = Get.put(GameController());
    final GameController gameController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de modo'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Solitario'),
              onPressed: () {
                Get.to(() => menuSeleccionDif());
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
            onPressed: () {
              Get.to(() => Versus());
            },
            child: const Text('Modo versus'),
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
          )),
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
