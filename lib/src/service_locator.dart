import 'package:yasli/src/scope.dart';

typedef ServiceFactory<T> = T Function(ServiceLocator);

abstract class ServiceLocator {
  ScopedService<T> get<T extends Object>();

  T shared<T extends Object>();

  T owned<T extends Object>();
}

extension AnyScope on ServiceLocator {
  T anyScope<T extends Object>() => get<T>().service;
}
