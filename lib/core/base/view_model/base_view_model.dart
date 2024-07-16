import 'package:flutter/material.dart';
import 'package:space_explorer/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  NavigationService navigationService = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
