import 'package:meta/meta.dart';

abstract class ServiceResource {
  void release();
}

enum Scope { shared, owned }

@immutable
class ScopedService<T> {
  const ScopedService(this.scope, this.service);

  const ScopedService.shared(this.service) : scope = Scope.shared;

  const ScopedService.owned(this.service) : scope = Scope.owned;

  final Scope scope;
  final T service;
}

abstract class ScopedResource implements ServiceResource {
  factory ScopedResource(ScopedService<ServiceResource> resource) =>
      resource.scope == Scope.owned
          ? _OwnedResource(resource.service)
          : const _SharedNoOpResource();
}

class _SharedNoOpResource implements ScopedResource {
  const _SharedNoOpResource();

  @override
  void release() {
    // No-op
  }
}

class _OwnedResource implements ScopedResource {
  const _OwnedResource(this._resource);

  @override
  void release() => _resource.release();

  final ServiceResource _resource;
}
