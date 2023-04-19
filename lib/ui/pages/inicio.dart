import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parcialgabrielalinares/ui/pages/selecmodo.dart';
import '../controllers/game_controller.dart';
import 'selecdif.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6B6C2), // Color pastel rosa claro
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Puntos y Famas',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                child: const Text(
                  'Iniciar Juego',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  Get.to(menuSeleccionModo());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
