import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:one_day_focus/providers/theme_provider.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(seasonColorsProvider);
    final now = DateTime.now();
    final dateStr = DateFormat('yyyy/MM/dd (E)', 'ja_JP').format(now);

    // 金曜21時以降のチェック（簡易版）
    _checkFridayReflection(context, now);

    return Scaffold(
      backgroundColor: colors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                dateStr,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [colors.primary.withOpacity(0.5), colors.background],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: colors.primary.withOpacity(0.3)),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: colors.primary.withOpacity(0.2),
                        child: Text('${index + 1}', style: TextStyle(color: colors.primary)),
                      ),
                      title: const Text('予定なし', style: TextStyle(color: Colors.grey)),
                      trailing: Switch(
                        value: false,
                        onChanged: (val) {},
                        activeColor: colors.primary,
                      ),
                      onTap: () {
                        // 予定登録ダイアログを表示
                      },
                    ),
                  );
                },
                childCount: 10, // 基本10個のスロット
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _checkFridayReflection(BuildContext context, DateTime now) {
    // 実際にはDBから最後に振り返りをしたか確認する
    if (now.weekday == DateTime.friday && now.hour >= 21) {
      // 振り返り画面を表示するロジックをここに
    }
  }
}
