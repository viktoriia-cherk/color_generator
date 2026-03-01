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

Color getNewRgbaColor({double? opacity}) {
  final rgb = generateRandomRgb();
  return Color.fromRGBO(rgb.r, rgb.g, rgb.b, opacity ?? defaultOpacity);
}

Color updateColorOpacity({required double opacity, required Color clr}) {
  final rgb = getRgbComponents(clr);
  return Color.fromRGBO(rgb.r, rgb.g, rgb.b, opacity);
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

Color rgbaStringToColor(String str) {
  final regex = RegExp(r'Color\((\d+), (\d+), (\d+), ([\d.]+)\)');
  final match = regex.firstMatch(str);

  if (match == null || match.groupCount != 4) {
    throw FormatException('Invalid color string format: $str');
  }

  final r = int.parse(match.group(1)!);
  final g = int.parse(match.group(2)!);
  final b = int.parse(match.group(3)!);
  final a = double.parse(match.group(4)!); // 0.0–1.0

  return Color.fromRGBO(r, g, b, a);
}
