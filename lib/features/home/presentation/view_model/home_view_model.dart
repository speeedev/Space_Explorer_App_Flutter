import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_explorer/core/base/view_model/base_view_model.dart';
import 'package:space_explorer/core/constants/navigation/navigation_constants.dart';
import 'package:space_explorer/core/init/models/planet_model.dart';
import 'package:space_explorer/core/init/network/model/response_model.dart';
import 'package:space_explorer/features/home/data/home_repository.dart';
import 'package:space_explorer/features/splash/presentation/view_model/splash_view_model.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();

  final CarouselController _carouselController = CarouselController();
  CarouselController get carouselController => _carouselController;

  int _carouselSliderIndex = 2;
  int get carouselSliderIndex => _carouselSliderIndex;

  List<PlanetModel> _planets = [];
  List<PlanetModel> get planets => _planets;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    SplashViewModel splashViewModel =
        Provider.of<SplashViewModel>(viewModelContext, listen: false);
    setLoading(true);
    if (splashViewModel.isLoadedData) {
      setPlanets(splashViewModel.loadedPlanets);
    } else {
      getPlanets();
    }
    setLoading(false);

  }

  Future<void> getPlanets() async {
    await _homeRepository.fetchPlanets().then((ResponseModel responseModel) {
      if (!responseModel.isError!) {
        setPlanets(responseModel.data!);
        notifyListeners();
      } else {
        //print("Error: ${responseModel.errorMessage}");
      }
    });
  }

  void setPlanets(List<PlanetModel> planets) {
    _planets = planets;
    notifyListeners();
  }

  void setCarouselSliderIndex(int index) {
    _carouselSliderIndex = index;
    notifyListeners();
  }

  bool isCurrentCarouselSliderIndex(PlanetModel planet) {
    return carouselSliderIndex == planets!.indexOf(planet);
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void navigateToPlanetDetail(PlanetModel planet) {
    navigationService.navigateToPage(
      path: NavigationConstants.PLANET_DETAIL,
      data: planet,
    );
  }
}
