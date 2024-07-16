import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_explorer/core/base/view_model/base_view_model.dart';
import 'package:space_explorer/core/constants/navigation/navigation_constants.dart';
import 'package:space_explorer/features/home/presentation/view_model/home_view_model.dart';

class SplashViewModel extends BaseViewModel with ChangeNotifier {
  bool _showImages = false;
  bool get showImages => _showImages;

  bool _showText = false;
  bool get showText => _showText;

  bool _isLoadedData = false;
  bool get isLoadedData => _isLoadedData;

  var _loadedPlanets = [];
  get loadedPlanets => _loadedPlanets;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    await loadData();
    await Future.delayed(const Duration(milliseconds: 500), () {
      _showImages = true;
      notifyListeners();
    });
    await Future.delayed(const Duration(milliseconds: 1000), () {
      _showText = true;
      notifyListeners();
    });
    await Future.delayed(const Duration(milliseconds: 1500), () {
      if (_isLoadedData) {
        navigateToHome();
      }
    });
  }

  Future<void> loadData() async {
    HomeViewModel homeViewModel =
        Provider.of<HomeViewModel>(viewModelContext, listen: false);
    await homeViewModel.getPlanets().then((value) {
      _loadedPlanets = loadedPlanets;
      _isLoadedData = true;
      notifyListeners();
    });
  }

  Future<void> navigateToHome() async {
    navigationService.navigateToPage(path: NavigationConstants.HOME);
  }
}
