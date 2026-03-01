import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../../../../features/color_generator_page/application/color_generator_bloc.dart';
import '../../../application/app_bloc/app_bloc.dart';
import '../../injections/injections.dart';

class AppBlocProvider {
  AppBlocProvider._();

  static List<SingleChildWidget> get providers => [
    BlocProvider<AppBloc>(
      create: (_) => getIt<AppBloc>()
        ..add(const AppEvent.init())
        ..add(AppEvent.getAppTheme()),
    ),
    BlocProvider<ColorGeneratorBloc>(
      create: (_) => getIt<ColorGeneratorBloc>()
        ..add(const ColorGeneratorEvent.initColorGenerator())
        ..add(ColorGeneratorEvent.getBackgroundColor()),
    ),
  ];
}
