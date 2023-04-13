import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class Versus extends StatefulWidget {
  @override
  _TableroState createState() => _TableroState();
}

class _TableroState extends State<Versus> {
  final GameController gameController = Get.find();
  bool turnoA = true;
  List<int> numerosA = [];
  List<int> numerosB = [];
  List<int> intentosA = [];
  List<int> intentosB = [];
  List<int> valoresCasillas = List.generate(5, (index) => 0);

  Widget build(BuildContext context) {
    final GameController gameController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida versus en curso'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text("Por favor ingrese su número, verifique que no haya números repetidos, si hay repetidos no podrá continuar"),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 5,
                children: List.generate(5, (index1) {
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
          ElevatedButton(
              onPressed: () {
                if (gameController.repetidos(valoresCasillas)) {
                  print('Hay números repetidos en la lista');
                } else {
                }
                print(valoresCasillas);
              },
              child: Text('Confirmar seleccion'),
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
