// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:singleton/example/singleton_factory.dart';
import 'package:singleton/example/singleton_raiz.dart';

class SingletonPage extends StatefulWidget {
  const SingletonPage({Key? key}) : super(key: key);

  @override
  State<SingletonPage> createState() => _SingletonPageState();
}

class _SingletonPageState extends State<SingletonPage> {
  @override
  void initState() {
    super.initState();

    print("");
    print("Sem Singleton:");
    print("");

    int a = 0;
    while (a < 5) {
      print("Sem Singleton: ${Raiz(Random().nextInt(100)).id}");
      a++;
    }

    print("");
    print("Singleton Raiz:");
    print("");
    int b = 0;
    while (b < 5) {
      print("Com Singleton: ${SingletonRaiz.instance.id}");
      b++;
    }

    print("");
    print("Singleton Factory:");
    print("");
    int c = 0;
    while (c < 5) {
      print("Com Singleton Factory: ${SingletonFactory().id}");
      c++;
    }

    print("");
    print("Problema do Singleton Factory:");
    print("");
    int d = 0;
    while (d < 10) {
      var instance = SingletonFactory();
      print(instance.id);

      if (d == 0) {
        instance.id = 20;
      }

      d++;
    }

    print("");

    print(
        """ O problema do Singleton Factory é que ele pode ser instanciado como uma Classe comum (sem o .instance), não há uma identificação de que ele é mesmo um Singleton, 
        isso só pode ser descoberto abrindo o arquivo e o analisando, então há esse perigo da instância ser modificada.
            
        Com o Singleton Raiz, esse problema também pode acontecer, porém, só é possível instanciar o Singleton Raiz assim: SingletonRaiz.instance.id
        (usando o .instance) que identifica para quem está instanciando que aquela Classe é de fato um Singleton
        e nāo deve ter a sua instância modificada pois isso afetará todo o sistema.
            
        """);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Singleton Example')),
      body: Container(),
    );
  }
}
