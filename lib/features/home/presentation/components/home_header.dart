part of "../home_view.dart";

class _HeaderStack extends StatelessWidget {
  final BuildContext context;
  final HomeViewModel viewModel;

  const _HeaderStack({
    required this.context,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var circleContainers = [
      Positioned(
        top: 10,
        right: 60,
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        top: 45,
        right: 45,
        child: Container(
          width: 15,
          height: 15,
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        left: 0,
        bottom: 5,
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.lightBlue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ];
    return Stack(
      alignment: Alignment.center,
      children: [
        const _BuildTitle(),
        ...circleContainers,
      ],
    );
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Space",
            style: context.textTheme.h1,
            textAlign: TextAlign.start,
          ),
          Text(
            "Explorer",
            style: context.textTheme.h1,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
