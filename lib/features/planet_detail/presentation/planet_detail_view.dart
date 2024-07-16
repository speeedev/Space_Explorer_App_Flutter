import 'package:flutter/material.dart';
import 'package:space_explorer/core/base/view/base_widget.dart';
import 'package:space_explorer/core/constants/img/image_constants.dart';
import 'package:space_explorer/core/init/extension/context_extension.dart';
import 'package:space_explorer/core/init/extension/text_theme_extension.dart';
import 'package:space_explorer/core/init/models/planet_model.dart';
import 'package:space_explorer/core/utils/color_utils.dart';
import 'package:space_explorer/features/planet_detail/presentation/view_model/planet_detail_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'components/planet_detail_header.dart';
part 'components/planet_detail_body.dart';

class PlanetDetailView extends StatelessWidget {
  final PlanetModel planet;
  const PlanetDetailView({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return BaseView<PlanetDetailViewModel>(
      viewModel: PlanetDetailViewModel(),
      onModelReady: (PlanetDetailViewModel viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        viewModel.initYouTubePlayer(planet.videoUrl ?? "");
      },
      onPageBuilder: (BuildContext context, PlanetDetailViewModel viewModel) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // remove shadow
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _PlanetDetailHeader(planet: planet),
                _PlanetDetailBody(planet: planet, viewModel: viewModel),
              ],
            ),
          ),
        );
      },
    );
  }
}
