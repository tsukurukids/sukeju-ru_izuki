import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_day_focus/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(seasonColorsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('テーマ設定'),
            subtitle: const Text('季節連動テーマ（自動）'),
            trailing: Icon(Icons.circle, color: colors.primary),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.add_task),
            title: const Text('タスク枠拡張 (+5)'),
            value: false,
            onChanged: (v) {},
            activeColor: colors.primary,
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text('デフォルトアラーム音'),
            subtitle: const Text('ピアノ・メロディ'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text('イラスト選択'),
            onTap: () {},
          ),
          const Divider(),
          const AboutListTile(
            applicationName: '1Day Focus & Brain Alarm',
            applicationVersion: '1.0.0',
            copyright: '© 2026 1Day Focus Team',
          ),
        ],
      ),
    );
  }
}
