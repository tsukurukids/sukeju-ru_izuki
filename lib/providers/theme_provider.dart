import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Season { spring, summer, autumn, winter }

class SeasonColors {
  final Color primary;
  final Color background;
  final Color accent;

  SeasonColors({
    required this.primary,
    required this.background,
    required this.accent,
  });
}

final seasonColorsProvider = Provider<SeasonColors>((ref) {
  final date = DateTime.now();
  final month = date.month;

  if (month >= 3 && month <= 5) {
    // 春: 桜色と新緑
    return SeasonColors(
      primary: Color(0xFFFFB7C5),
      background: Color(0xFFFFF5F7),
      accent: Color(0xFF90EE90),
    );
  } else if (month >= 6 && month <= 8) {
    // 夏: 向日葵と青空
    return SeasonColors(
      primary: Color(0xFF4FC3F7),
      background: Color(0xFFE1F5FE),
      accent: Color(0xFFFFD54F),
    );
  } else if (month >= 9 && month <= 11) {
    // 秋: 紅葉と夕焼け
    return SeasonColors(
      primary: Color(0xFFFF7043),
      background: Color(0xFFFFF3E0),
      accent: Color(0xFF8D6E63),
    );
  } else {
    // 冬: 雪と静寂
    return SeasonColors(
      primary: Color(0xFF9FA8DA),
      background: Color(0xFFECEFF1),
      accent: Color(0xFFFFFFFF),
    );
  }
});
