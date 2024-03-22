import 'package:dio/io.dart';

class AppClient extends DioForNative {
  AppClient() {
    options.baseUrl = "https://65f8c8d0df15145246100680.mockapi.io/api"; // API
  }
}
