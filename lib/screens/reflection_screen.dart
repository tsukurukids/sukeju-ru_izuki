import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_day_focus/providers/theme_provider.dart';

class ReflectionScreen extends ConsumerStatefulWidget {
  const ReflectionScreen({super.key});

  @override
  ConsumerState<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends ConsumerState<ReflectionScreen> {
  double _score = 5.0;
  final TextEditingController _controller = TextEditingController();
  bool _isFinished = false;

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(seasonColorsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('今週の振り返り')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _isFinished ? _buildFinishView() : _buildInputView(colors),
      ),
    );
  }

  Widget _buildInputView(SeasonColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('今週の達成度は？', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Slider(
          value: _score,
          min: 0,
          max: 10,
          divisions: 10,
          label: _score.round().toString(),
          activeColor: colors.primary,
          onChanged: (v) => setState(() => _score = v),
        ),
        const SizedBox(height: 24),
        const Text('感想・振り返り', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextField(
          controller: _controller,
          maxLines: 5,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '今週はどうでしたか？'),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: colors.primary, padding: const EdgeInsets.all(16)),
          onPressed: () => setState(() => _isFinished = true),
          child: const Text('完了', style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildFinishView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.favorite, color: Colors.pink, size: 80),
        const SizedBox(height: 24),
        const Text(
          '今週もお疲れ様！よく頑張ったね！',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('戻る'),
        ),
      ],
    );
  }
}
