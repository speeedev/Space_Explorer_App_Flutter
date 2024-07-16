part of '../planet_detail_view.dart';

class _PlanetDetailBody extends StatelessWidget {
  final PlanetModel planet;
  final PlanetDetailViewModel viewModel;
  const _PlanetDetailBody({
    required this.planet,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.05),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planet.name,
              style: context.textTheme.h2,
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Text(
              planet.longDescription ?? planet.shortDescription,
              style: context.textTheme.h6,
            ),
            context.emptySizedHeightNormal,
            viewModel.isAvailableVideo
                ? SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: viewModel.youtubePlayerController,
                        ),
                        builder: (context, player) {
                          return Column(
                            children: [
                              player,
                              context.emptySizedHeightMedium,
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : Container(),
            context.emptySizedHeightNormal,
          ],
        ),
      ),
    );
  }
}
