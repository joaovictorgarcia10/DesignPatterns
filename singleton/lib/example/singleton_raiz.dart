import 'dart:math';

class SingletonRaiz {
  late int id;

  // Base do Singleton
  SingletonRaiz._(this.id);
  static final SingletonRaiz _instance = SingletonRaiz._(Random().nextInt(100));
  static get instance => _instance;
}

// Sem Singleton
class Raiz {
  late int id;
  Raiz(this.id);
}
