import 'package:flutter_riverpod/flutter_riverpod.dart';

final playVideoProvider = StateProvider<bool>((ref) {
  bool isPlaying = false;

  return isPlaying;
});
