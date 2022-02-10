import 'package:get/get.dart';

import '../models/response/rp_dash_board_list.dart';
import '../services/repository/home_repo.dart';

class DashboardController extends GetxController {
  final HomeRepo homeRepo;
  DashboardController({
    required this.homeRepo,
  });

  final RpDashboardTopList _topList = RpDashboardTopList();
  List serviceList = [
    'Customer Receipt'.tr,
    'Supplier Payment'.tr,
    'Today\'s Summery'.tr,
    'Return Order'.tr,
    'POS'.tr
  ];
  bool _isAccountPopup = false;
  bool _isMenu = true;
  bool _isMenuPopup = false;
  bool _isExpand = false;
  bool _isExpand2 = false;
  bool get isAccountPopup => _isAccountPopup;
  RpDashboardTopList get topList => _topList;
  bool get isMenuPopup => _isMenuPopup;
  bool get isExpand => _isExpand;
  bool get isExpand2 => _isExpand2;
  bool get isMenu => _isMenu;

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

  void updateIsExpand() {
    _isExpand = !_isExpand;
    update();
  }

  void updateIsExpand2() {
    _isExpand2 = !_isExpand2;
    update();
  }

  void updateMenu() {
    _isMenu = !_isMenu;
    update();
  }
}
