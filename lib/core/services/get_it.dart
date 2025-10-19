import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo.dart';
import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo_imp.dart';
import 'package:dishboard_fruits_app/core/repo/product_repo/product_repo.dart';
import 'package:dishboard_fruits_app/core/repo/product_repo/product_repo_implem.dart';
import 'package:dishboard_fruits_app/core/services/database_service.dart';
import 'package:dishboard_fruits_app/core/services/fire_store_services.dart';
import 'package:dishboard_fruits_app/core/services/storage_service.dart';
import 'package:dishboard_fruits_app/core/services/supbase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorage());
  getIt.registerSingleton<DatabaseService>(FireStoreServices());


  getIt.registerSingleton<ImageRepo>(ImageRepoImp(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImplem(getIt.get<DatabaseService>()),
  );
}
