// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:color_generator/features/color_generator_page/presentation/color_generator_page.dart'
    as _i1;
import 'package:color_generator/features/history_page/history_page.dart' as _i2;
import 'package:color_generator/features/home_page/presentation/home_page.dart'
    as _i3;

/// generated route for
/// [_i1.ColorGeneratorPage]
class ColorGeneratorRoute extends _i4.PageRouteInfo<void> {
  const ColorGeneratorRoute({List<_i4.PageRouteInfo>? children})
    : super(ColorGeneratorRoute.name, initialChildren: children);

  static const String name = 'ColorGeneratorRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ColorGeneratorPage();
    },
  );
}

/// generated route for
/// [_i2.HistoryPage]
class HistoryRoute extends _i4.PageRouteInfo<void> {
  const HistoryRoute({List<_i4.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HistoryPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}
