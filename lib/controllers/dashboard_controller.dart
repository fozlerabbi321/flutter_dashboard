import 'package:get/get.dart';

import '../services/repository/home_repo.dart';

class DashboardController extends GetxController {
  final HomeRepo homeRepo;
  DashboardController({
    required this.homeRepo,
  });

  bool _isAccountPopup = false;
  bool _isMenuPopup = false;
  bool get isAccountPopup => _isAccountPopup;
  bool get isMenuPopup => _isMenuPopup;

  ///open and close account popup
  void updateAccountPopup() {
    _isAccountPopup = !_isAccountPopup;
    _isMenuPopup = false;
    update();
  }

  ///open and close account menu popup
  void updateAccountMenuPopup() {
    _isMenuPopup = !_isMenuPopup;
    _isAccountPopup = false;
    update();
  }
}
