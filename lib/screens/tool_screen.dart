import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_day_focus/providers/theme_provider.dart';

class ToolScreen extends ConsumerStatefulWidget {
  const ToolScreen({super.key});

  @override
  ConsumerState<ToolScreen> createState() => _ToolScreenState();
}

class _ToolScreenState extends ConsumerState<ToolScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(seasonColorsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ツール'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: colors.primary,
          labelColor: colors.primary,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.watch_later_outlined), text: '時計'),
            Tab(icon: Icon(Icons.timer_outlined), text: 'タイマー'),
            Tab(icon: Icon(Icons.timer_10_outlined), text: 'ストップウォッチ'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildClockView(colors),
          _buildTimerView(colors),
          _buildStopwatchView(colors),
        ],
      ),
    );
  }

  Widget _buildClockView(SeasonColors colors) {
    return Center(
      child: Text(
        '18:45',
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: colors.primary),
      ),
    );
  }

  Widget _buildTimerView(SeasonColors colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('よそ見防止機能', style: TextStyle(fontWeight: FontWeight.bold)),
        Switch(value: true, onChanged: (v) {}, activeColor: colors.primary),
        const SizedBox(height: 40),
        Text('25:00', style: TextStyle(fontSize: 60, color: colors.primary)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: colors.primary, foregroundColor: Colors.white),
          child: const Text('スタート'),
        ),
      ],
    );
  }

  Widget _buildStopwatchView(SeasonColors colors) {
    return const Center(child: Text('ストップウォッチ準備中'));
  }
}
