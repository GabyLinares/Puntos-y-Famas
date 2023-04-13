import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class TableroF extends StatefulWidget {
  @override
  _TableroState createState() => _TableroState();
}

class _TableroState extends State<TableroF> {
  bool facil = true;
  bool normal = false;
  bool dificil = false;
  List<int> valoresCasillas = List.generate(3, (index) => 0);
  List<Color> coloresCasillas = List.generate(3, (index) => Colors.white);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
    if (gameController.numerosJuego.isEmpty) {
      gameController.generarNumerosJuego(facil, normal, dificil);
      print(gameController.numerosJuego);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida solitaria en curso'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(3, (index1) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        gameController.intentos++;
                        valoresCasillas[index1] =
                            gameController.selecNums(valoresCasillas[index1]);
                        print(valoresCasillas[index1]);
                        gameController.verificarIntento(valoresCasillas);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          valoresCasillas[index1] == 0
                              ? ""
                              : valoresCasillas[index1].toString(),
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text('Famas: ${gameController.famas}'),
          Text('Puntos: ${gameController.puntos}'),
          Text('Intentos: ${gameController.intentos}'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (gameController.todosCorrectos(valoresCasillas)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('¡Felicitaciones!'),
                          content: Text('Has adivinado todos los números'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Volver al inicio'),
                              onPressed: () {
                                gameController.reiniciar();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              )),
        ],
      ),
    );
  }
}
