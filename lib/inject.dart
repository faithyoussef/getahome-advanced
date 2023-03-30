import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled1/utils/http.dart';
import 'package:untitled1/utils/network_notifier.dart';

final getIt = GetIt.I;

Future<void> initApp() async {
  // module
  getIt.registerSingleton<Connectivity>(Connectivity());
  getIt.registerSingleton<Dio>(Dio());

  // service
  getIt.registerSingleton<NetworkNotifier>(NetworkNotifier(getIt()));
  getIt.registerSingleton<Http>(Http(getIt()));

  /// datasource
 //getIt.registerSingleton<IPropertyRemoteDataSource>(PropertyRemoteDataSource(getIt()));

  /// repository
  //getIt.registerSingleton<PropertyRepository>(PropertyRepository(networkNotifier: getIt(), propertyRemoteDataSource: getIt(),),);

  /// provider
}