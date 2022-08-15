import 'dart:math';

class SingletonFactory {
  late int id;

  // Base do Singleton Factory
  SingletonFactory._(this.id);
  static final SingletonFactory _instance =
      SingletonFactory._(Random().nextInt(100));
  factory SingletonFactory() => _instance;
}
