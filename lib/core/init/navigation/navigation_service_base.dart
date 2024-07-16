abstract class NavigationServiceBase {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
  void back();
}