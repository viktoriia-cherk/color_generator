import 'dart:math';
import 'dart:ui';
import '../../../domain/color/rgb_model.dart';

const rgbMaxValue = 255;
const defaultOpacity = 1.0;

RgbModel generateRandomRgb() {
  final random = Random();

  return RgbModel(
    r: random.nextInt(rgbMaxValue),
    g: random.nextInt(rgbMaxValue),
    b: random.nextInt(rgbMaxValue),
  );
}

Color getNewRgbaColor() {
  final rgb = generateRandomRgb();
  return Color.fromRGBO(rgb.r, rgb.g, rgb.b, defaultOpacity);
}

RgbModel getRgbComponents(Color color) {
  final r = (color.r * rgbMaxValue).round();
  final g = (color.g * rgbMaxValue).round();
  final b = (color.b * rgbMaxValue).round();

  return RgbModel(r: r, g: g, b: b);
}

String colorToRgbaString(Color clr) {
  final rgb = getRgbComponents(clr);
  final a = clr.a;

  return 'Color(${rgb.r}, ${rgb.g}, ${rgb.b}, $a)';
}
