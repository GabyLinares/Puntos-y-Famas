import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class VersusN2 extends StatefulWidget {
  @override
  _TableroState createState() => _TableroState();
}

class _TableroState extends State<VersusN2> {
  bool turnoA = true;
  List<int> valoresCasillas = List.generate(4, (index) => -1);
  List<Color> coloresCasillas = List.generate(4, (index) => Colors.white);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida versus en curso'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(4, (index1) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        valoresCasillas[index1] =
                            gameController.selecNums(valoresCasillas[index1]);
                        print(valoresCasillas[index1]);
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
                          valoresCasillas[index1] == -1
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
          Text('Intentos: ${gameController.intentosB}'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (turnoA) {
                    if (gameController.numerosJuego.isEmpty) {
                      if (!gameController.repetidos(valoresCasillas)) {
                        gameController.listFrom(valoresCasillas);
                        print(gameController.numerosJuego);
                        valoresCasillas = List.generate(4, (index) => -1);
                        turnoA = false;
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content:
                                  Text('Hay números repetidos en la selección'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  } else {
                    if (gameController.todosCorrectos(valoresCasillas)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('¡Felicitaciones!'),
                            content: Text(gameController.intentosA >
                                    gameController.intentosB
                                ? 'Has adivinado todos los números, el ganador es el jugador A'
                                : 'Has adivinado todos los números, el ganador es el jugador B'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Volver al inicio'),
                                onPressed: () {
                                  gameController.reiniciar();
                                  gameController.reinicioVer();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      if (!gameController.repetidos(valoresCasillas)) {
                        gameController.verificarIntento(valoresCasillas);
                        valoresCasillas = List.generate(4, (index) => -1);
                        gameController.intentosB++;
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content:
                                  Text('Hay números repetidos en la selección'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
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
