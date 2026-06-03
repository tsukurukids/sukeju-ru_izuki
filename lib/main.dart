import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:one_day_focus/providers/theme_provider.dart';
import 'package:one_day_focus/screens/schedule_screen.dart';
import 'package:one_day_focus/screens/tool_screen.dart';
import 'package:one_day_focus/screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Isarの初期化などはここに記述（本来は非同期）
  runApp(
    const ProviderScope(
      child: OneDayFocusApp(),
    ),
  );
}

class OneDayFocusApp extends ConsumerWidget {
  const OneDayFocusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(seasonColorsProvider);

    return MaterialApp(
      title: '1Day Focus',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.primary,
          background: colors.background,
        ),
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ScheduleScreen(),
    const ToolScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'スケジュール'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'ツール'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}
