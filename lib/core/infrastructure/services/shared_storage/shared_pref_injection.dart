import 'package:color_generator/core/infrastructure/services/shared_storage/shared_storage_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedPreferencesDi {
  @preResolve
  @lazySingleton
  Future<SharedStorageService> get sharedService =>
      SharedStorageService().init();
}
