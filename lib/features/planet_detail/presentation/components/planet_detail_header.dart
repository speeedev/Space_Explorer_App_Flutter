part of '../planet_detail_view.dart';

class _PlanetDetailHeader extends StatelessWidget {
  final PlanetModel planet;
  const _PlanetDetailHeader({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.5),
      child: Stack(
        children: [
          Positioned(
            top: context.dynamicHeight(0.2),
            right: context.dynamicWidth(0.4),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: ColorUtils.randomColor(),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.38),
            right: context.dynamicWidth(0.12),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: ColorUtils.randomColor(),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.22),
            left: context.dynamicWidth(0.04),
            child: Text(
              planet.orderOfProximityToSun.toString(),
              style: context.textTheme.h1.copyWith(
                color: context.colors.onBackground.withOpacity(0.15),
                fontSize: context.dynamicHeight(0.28),
              ),
            ),
          ),
          Positioned(
            top: -context.dynamicHeight(0.1),
            right: -context.dynamicWidth(0.25),
            child: Hero(
              tag: planet.id,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(int.parse(planet.primaryColor))
                          .withOpacity(0.2),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Image.network(
                  planet.imageUrl,
                  fit: BoxFit.contain,
                  height: context.dynamicHeight(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.28),
            right: context.dynamicWidth(0.15),
            child: Image.asset(
              ImagePathConstants.rocket,
              fit: BoxFit.contain,
              width: context.dynamicWidth(0.45),
              height: context.dynamicHeight(0.22),
            ),
          ),
        ],
      ),
    );
  }
}
