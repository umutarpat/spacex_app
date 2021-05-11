import 'package:dio/dio.dart';
import 'package:test1_app/global/models/spacex_latest_model.dart';

Future<SpacexLatest> getLatestService() async {
  try {
    var response =
        await Dio().get('https://api.spacexdata.com/v4/launches/latest');
    final spacexLatest = spacexLatestFromJson(response.toString());
    print("Success: ${spacexLatest.success}");
    return spacexLatest;
  } catch (e) {
    print(e);
  }
}
