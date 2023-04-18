import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class GameController extends GetxController {
  
  // SELECCION DE NUMEROS AL AZAR SIN QUE SE REPITAN PARA LAS CUADRICULAS (no incluye el 0)
  List<int> _numerosJuego = [];

  void generarNumerosJuego(bool facil, bool normal, bool dificil) {
    final rng = Random();
    _numerosJuego.clear();

    if (facil == true) {
      while (_numerosJuego.length < 3) {
      int nuevoNumero = rng.nextInt(9) + 1;
      if (!_numerosJuego.contains(nuevoNumero)) {
        _numerosJuego.add(nuevoNumero);
      }
    }
    }

    else if (normal == true) {
      while (_numerosJuego.length < 4) {
      int nuevoNumero = rng.nextInt(9) + 1;
      if (!_numerosJuego.contains(nuevoNumero)) {
        _numerosJuego.add(nuevoNumero);
      }
    }
    }

      else if (dificil == true) {
      while (_numerosJuego.length < 5) {
      int nuevoNumero = rng.nextInt(9) + 1;
      if (!_numerosJuego.contains(nuevoNumero)) {
        _numerosJuego.add(nuevoNumero);
      }
    }
    }
    
  }

  List<int> get numerosJuego => _numerosJuego;

  // SELECCION DE NUMEROS POR PARTE DEL JUGADOR
  int selecNums(int num) {
  num = (num + 1) % 10;
  return num;
}

  // VERIFICA SI LOS NÚMEROS COICIDEN
  bool verificarNumero(int index, int valor) {
  if (_numerosJuego[index] == valor) {
    return true;
  } else {
    return false;
  }
}

  // VERIFICACION DE PUNTOS, FAMAS E INTENTOS

  int intentos = 0;
  int famas = 0;
  int puntos = 0;

  void verificarIntento(List<int> valoresCasillas) {
    famas = 0;
    puntos = 0;

    for (int i = 0; i < _numerosJuego.length; i++) {
      if (_numerosJuego[i] == valoresCasillas[i]) {
        famas++;
      } else if (_numerosJuego.contains(valoresCasillas[i])) {
        puntos++;
      }
    }
}

// VERIFICAR TODO CORRECTOS
bool todosCorrectos(List<int> valoresCasillas) {
  for (int i = 0; i < _numerosJuego.length; i++) {
    if (_numerosJuego[i] != valoresCasillas[i]) {
      return false;
    }
  }
  return true;
}

// REINICIO DE PARTIDA
void reiniciar() {
  numerosJuego.clear();
  intentos = 0;
  famas = 0;
  puntos = 0;
}

// VERIFICACION DE REPETIDOS
bool repetidos(List<int> listaNumeros) {
  final numerosUnicos = Set<int>();
  for (final numero in listaNumeros) {
    if (numerosUnicos.contains(numero)) {
      return true;
    } else {
      numerosUnicos.add(numero);
    }
  }
  return false;
}

void listFrom(valoresCasillas) {
  _numerosJuego = List.from(valoresCasillas);
}

}