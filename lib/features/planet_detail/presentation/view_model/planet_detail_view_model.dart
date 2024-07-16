import 'package:flutter/material.dart';
import 'package:space_explorer/core/base/view_model/base_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanetDetailViewModel extends BaseViewModel with ChangeNotifier {
  bool isAvailableVideo = false;
  late String planetVideoUrl;
  YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
    initialVideoId: "",
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );
  get youtubePlayerController => _youtubePlayerController;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
  void initYouTubePlayer(String planetVideoUrl) {
    try {
      if (planetVideoUrl.isNotEmpty) {
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(planetVideoUrl) ?? "",
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ),
        );
        isAvailableVideo = true;
      } else {
        throw Exception("Video URL is empty");
      }
    } catch (e) {
      isAvailableVideo = false;
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }
}
