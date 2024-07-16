import 'package:flutter/material.dart';
import 'package:space_explorer/core/base/view/base_widget.dart';
import 'package:space_explorer/core/constants/img/image_constants.dart';
import 'package:space_explorer/core/init/extension/context_extension.dart';
import 'package:space_explorer/core/init/extension/text_theme_extension.dart';
import 'package:space_explorer/features/splash/presentation/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (SplashViewModel viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) {
        return Scaffold(
          body: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                left: viewModel.showImages
                    ? -context.dynamicWidth(0.2)
                    : -context.dynamicWidth(0.3),
                bottom: viewModel.showImages
                    ? -context.dynamicHeight(0.2)
                    : -context.dynamicHeight(0.3),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: viewModel.showImages ? 1 : 0,
                  child: Image.asset(ImagePathConstants.world),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: viewModel.showText ? 1 : 0,
                  child: Text(
                    'Space Explorer',
                    style: context.textTheme.h3
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                right: viewModel.showImages
                    ? -context.dynamicHeight(0.1)
                    : -context.dynamicHeight(0.4),
                top: viewModel.showImages
                    ? -context.dynamicHeight(0.1)
                    : -context.dynamicHeight(0.4),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: viewModel.showImages ? 1 : 0,
                  child: Image.asset(
                    ImagePathConstants.mercury,
                    width: context.dynamicWidth(0.8),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
