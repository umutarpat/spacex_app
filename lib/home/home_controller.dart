import 'package:get/get.dart';
import 'package:test1_app/Home/home_service.dart';
import 'package:test1_app/global/models/spacex_latest_model.dart';

class HomeController extends GetxController {
  Future<SpacexLatest> getLatestData() {
    return getLatestService();
  }
}
