import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_explorer/core/base/view/base_widget.dart';
import 'package:space_explorer/core/constants/color/colors_constants.dart';
import 'package:space_explorer/core/constants/img/image_constants.dart';
import 'package:space_explorer/core/init/extension/color_extension.dart';
import 'package:space_explorer/core/init/extension/context_extension.dart';
import 'package:space_explorer/core/init/extension/text_theme_extension.dart';
import 'package:space_explorer/core/init/models/planet_model.dart';
import 'package:space_explorer/features/home/presentation/view_model/home_view_model.dart';

part 'components/home_header.dart';
part 'components/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (HomeViewModel viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
        return Container(
          decoration: backgroundDecoration(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.dynamicHeight(0.08)),
                  _HeaderStack(context: context, viewModel: viewModel),
                  const Spacer(),
                  viewModel.isLoading ? const CircularProgressIndicator() : _PlanetCarouselSlider(context: context, viewModel: viewModel),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration backgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImagePathConstants.star_background),
        fit: BoxFit.cover,
        opacity: 0.6,
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorConstants.glacialBlueIce,
          ColorConstants.persianIndigo,
        ],
      ),
    );
  }
}
