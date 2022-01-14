import 'package:asunnyday/view/screens/home/home_screen.dart';
import 'package:asunnyday/view/screens/permission_question_screen.dart';
import 'package:asunnyday/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

enum RouteAnimationType {
  instant,
  horizontal,
  vertical,
  fade,
}

class Routers {
  static void showSearchScreen(BuildContext ctx) =>
      _push(ctx, const SearchScreen(), animation: RouteAnimationType.horizontal);

  static void showHomeScreen(BuildContext ctx) =>
      _push(ctx, const HomeScreen(), animation: RouteAnimationType.horizontal);

  static void showPermissionQuestionScreen(BuildContext ctx) =>
      _push(ctx, const PermissionQuestionScreen(), animation: RouteAnimationType.vertical);

  static List<String> _navStackInfo = [];

  // TODO: Refactor this to make transitions more controlled
  static Future<dynamic> _push(
    BuildContext ctx,
    Widget screen, {
    bool replaceRoute = false,
    RouteAnimationType animation = RouteAnimationType.horizontal,
    RoutePredicate? until,
  }) async {
    final routeName = screen.runtimeType.toString();

    if (until != null) {
      // TODO: Fix this so that pop until actually clears the nav stack info too
      _navStackInfo.add('-- POP UNTIL X --');
    } else if (replaceRoute) {
      if (_navStackInfo.isNotEmpty) _navStackInfo.removeLast();
    }
    _navStackInfo.add(routeName + (replaceRoute ? ' (REPLACED)' : ''));

    final pageRoute = _getPageRoute(screen, animation);

    if (!kReleaseMode) _logNavStack();

    try {
      if (until != null) {
        return Navigator.of(ctx).pushAndRemoveUntil(pageRoute, until);
      } else if (replaceRoute) {
        return Navigator.of(ctx).pushReplacement(pageRoute);
      } else {
        return Navigator.of(ctx).push(pageRoute);
      }
    } catch (_) {
      // TODO: Remove this catch when snackbars are hidden on page navigation.
      // If ctx is disposed, do not navigate. This can happen if a snackbar
      // is displayed on screen X and the user closes screen X and then clicks
      // on a button in the snackbar. That will use the context of screen X and
      // that will crash (because that context is disposed).
    }
  }

  static PageRouteBuilder _getPageRoute(
    Widget page,
    RouteAnimationType animation,
  ) {
    switch (animation) {
      case RouteAnimationType.instant:
        return _instantAnimation(page);
      case RouteAnimationType.horizontal:
        return _horizontalSlideAnimation(page);
      case RouteAnimationType.fade:
        return _fadeRouteAnimation(page);
      case RouteAnimationType.vertical:
      default:
        return _verticalSlideAnimation(page);
    }
  }

  static void _logNavStack() {
    // developer.log('NAV: ${_navigationStack.join(' > ')}');
  }

  static PageRouteBuilder _instantAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (ctx, animation, secondaryAnimation) => page,
    );
  }

  static PageRouteBuilder _verticalSlideAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (ctx, animation, secondaryAnimation) => page,
      transitionsBuilder: (ctx2, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.ease, parent: animation);
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _horizontalSlideAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (ctx, animation, secondaryAnimation) => page,
      transitionsBuilder: (ctx2, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.ease, parent: animation);
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _fadeRouteAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (ctx, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (ctx2, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.ease, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
