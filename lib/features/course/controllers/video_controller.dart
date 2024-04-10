import 'package:flutter_riverpod/flutter_riverpod.dart';

//Using the changeNotiferProvider
/*
final VideoNotifer videoNotifer = VideoNotifer();

class VideoNotifer extends ChangeNotifier {
  bool isPlaying = false;

  void playCourse() {
    _isPlaying(!isPlaying);
  }

  _isPlaying(bool isPlaying) {
    this.isPlaying = isPlaying;
    notifyListeners();
  }
}

final playVideoProvider = ChangeNotifierProvider((ref) {
  return videoNotifer;
});
*/

//Using the StateProvider
/*
final playVideoProvider = StateProvider<bool>((ref) {
  bool isPlaying = false;

  return isPlaying;
});
*/

//Using the StateNotifierProvider

final VideoNotifier _videoNotifier = VideoNotifier(false);

class VideoNotifier extends StateNotifier<bool> {
  VideoNotifier(super.state);
  void play() {
    state = !state;
  }
}

final playVideoProvider = StateNotifierProvider<VideoNotifier, bool>((ref) {
  return _videoNotifier;
});
