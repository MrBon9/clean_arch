part of app_layer;

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
}

Future _registerAppComponents() async {
  final appTheme = ThemeManager();
  getIt.registerSingleton(appTheme);
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
    ),
  );

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ],
  );

  getIt.registerSingleton(dio);
}
