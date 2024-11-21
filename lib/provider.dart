import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'snack_notifier.dart';
import 'snack_state.dart';

final refSnackState = StateNotifierProvider<SnackNotifier, SnackState>((ref) {
  return SnackNotifier();
});
