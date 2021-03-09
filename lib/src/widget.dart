import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:yasli/src/service_locator.dart';

class ServiceLocatorWidget extends InheritedWidget {
  final ServiceLocator locator;

  const ServiceLocatorWidget(
    this.locator, {
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static ServiceLocator of(BuildContext context) => (context
          .getElementForInheritedWidgetOfExactType<ServiceLocatorWidget>()!
          // ignore: avoid_as
          .widget as ServiceLocatorWidget)
      .locator;

  static ServiceLocator observe(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ServiceLocatorWidget>()!
      .locator;

  @override
  bool updateShouldNotify(ServiceLocatorWidget oldWidget) =>
      !identical(locator, oldWidget.locator);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ServiceLocator>('locator', locator));
  }
}
