import 'package:flutter/cupertino.dart';
import '../../src/products/view/product_listing_screen.dart';
import '../../src/splash/view/splash_screen.dart';
import '../common_widgets/empty_screen.dart';
import 'route_constants.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.routeInitial:
        return _buildRoute(RouteConstants.routeInitial, const SplashScreen());

      case RouteConstants.routeProductListingScreen:
        return _buildRoute(
          RouteConstants.routeProductListingScreen,
          const ProductListingScreen(),
        );

      default:
        return _buildRoute(RouteConstants.routeEmpty, const EmptyScreen());
    }
  }
}

Route _buildRoute(
  String route,
  Widget widget, {
  bool enableFullScreen = false,
}) {
  return CupertinoPageRoute(
    fullscreenDialog: enableFullScreen,
    settings: RouteSettings(name: route),
    builder: (_) => widget,
  );
}
