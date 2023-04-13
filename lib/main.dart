import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/controllers/game_controller.dart';
import 'ui/pages/inicio.dart';



void main() {
  Get.lazyPut<GameController>(() => GameController());
  runApp(PuntosyFamas());
}

class PuntosyFamas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inicio',
      home: Inicio(),
    );
  }
}
