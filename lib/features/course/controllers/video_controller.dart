import 'package:flutter_riverpod/flutter_riverpod.dart';

// final VideoController videoController = VideoController();

// class VideoController extends ChangeNotifier {
//   bool isPlaying = false;

//   void playCourse() {
//     _isPlaying(!isPlaying);
//   }

//   _isPlaying(bool isPlaying) {
//     this.isPlaying = isPlaying;
//     notifyListeners();
//   }
// }

// final playVideoProvider = ChangeNotifierProvider((ref) {
//   return videoController;
// });

final playVideoProvider = StateProvider<bool>((ref) {
  bool isPlaying = false;
  void sign() {
    return;
  }

  return isPlaying;
});