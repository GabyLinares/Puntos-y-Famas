import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcialgabrielalinares/ui/pages/selecdif.dart';
import '../controllers/game_controller.dart';
import 'package:parcialgabrielalinares/ui/pages/selecdif2.dart';

class menuSeleccionModo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final GameController gameController = Get.put(GameController());
    final GameController gameController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de modo'),
        automaticallyImplyLeading: false,
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
              Get.to(() => menuSeleccionDifVer());
            },
            child: const Text('Versus'),
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
          const SizedBox(height: 20.0), // Espacio entre los botones y el texto
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Selecciona un modo de juego:\n\n- Solitario: Adivina un conjunto de números aleatorios en el menor número de intentos posibles.\n\n- Versus: Juega contra otro jugador y adivina los números que este ha seleccionado en el menor número de intentos posibles.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
