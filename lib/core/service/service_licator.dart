import 'package:dalel_app/core/dataBase/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
