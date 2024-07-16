part of "../home_view.dart";

class _PlanetCarouselSlider extends StatelessWidget {
  final BuildContext context;
  final HomeViewModel viewModel;

  const _PlanetCarouselSlider({
    super.key,
    required this.context,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: viewModel.carouselSliderIndex,
        height: context.dynamicHeight(0.5),
        enlargeCenterPage: true,
        viewportFraction: 0.6,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        aspectRatio: 2.0,
        autoPlayCurve: Curves.slowMiddle,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: (index, reason) {
          viewModel.setCarouselSliderIndex(index);
        },
      ),
      items: viewModel.planets.map((planet) {
        return Stack(
          children: [
            _BuildCard(
              viewModel: viewModel,
              planet: planet,
            ),
            _BuildPlanetImage(planet: planet),
            if (viewModel.isCurrentCarouselSliderIndex(planet))
              _BuildGoDetailButton(viewModel: viewModel, planet: planet),
          ],
        );
      }).toList(),
    );
  }
}

class _BuildGoDetailButton extends StatelessWidget {
  const _BuildGoDetailButton({
    required this.viewModel,
    required this.planet,
  });
  final HomeViewModel viewModel;
  final PlanetModel planet;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.dynamicHeight(0.04),
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            gradient: context.colors.darkYellowToLightYellow,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.surface,
              width: 4,
            ),
          ),
          height: context.dynamicHeight(0.09),
          width: context.dynamicHeight(0.09),
          child: ElevatedButton(
            onPressed: () {
              HapticFeedback.vibrate();
              viewModel.navigateToPlanetDetail(planet);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Icon(
              color: context.colors.onPrimary,
              Icons.arrow_forward,
              size: context.dynamicWidth(0.06),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildPlanetImage extends StatelessWidget {
  const _BuildPlanetImage({
    required this.planet,
  });
  final PlanetModel planet;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: (context.dynamicWidth(0.5) - context.dynamicWidth(0.4)) / 2,
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Color(int.parse(planet.primaryColor)).withOpacity(0.1),
                content: Image.network(planet.imageUrl),
                actionsOverflowDirection: VerticalDirection.up,
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(int.parse(planet.primaryColor)).withOpacity(0.2),
                offset: const Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Hero(
            tag: planet.id,
            child: Image.network(
              planet.imageUrl,
              width: context.dynamicWidth(0.5),
              height: context.dynamicHeight(0.2),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard({
    required this.viewModel,
    required this.planet,
  });

  final HomeViewModel viewModel;
  final PlanetModel planet;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.dynamicHeight(0.1),
      left: 0,
      right: 0,
      child: Container(
        height: context.dynamicHeight(0.32),
        decoration: ShapeDecoration(
          color: viewModel.isCurrentCarouselSliderIndex(planet)
              ? context.colors.surface
              : context.colors.surfaceVariant,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 40,
              cornerSmoothing: 0.4,
            ),
          ),
        ),
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.dynamicHeight(0.09),
              ),
              Stack(
                children: [
                  if (viewModel.isCurrentCarouselSliderIndex(planet))
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        planet.orderOfProximityToSun.toString(),
                        style: context.textTheme.h1.copyWith(
                          fontSize: context.dynamicHeight(0.16),
                          color: context.colors.onSurface.withOpacity(0.15),
                        ),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.name,
                        style: context.textTheme.h3.copyWith(
                          color: viewModel.isCurrentCarouselSliderIndex(planet)
                              ? context.textTheme.h3.color
                              : context.textTheme.h3.color!.withOpacity(0.6),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        planet.shortDescription,
                        style: context.textTheme.h6.copyWith(
                          color: viewModel.isCurrentCarouselSliderIndex(planet)
                              ? context.colors.onSurface
                              : context.colors.onSurfaceVariant
                                  .withOpacity(0.4),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
