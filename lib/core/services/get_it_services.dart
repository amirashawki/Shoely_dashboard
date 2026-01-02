import 'package:get_it/get_it.dart';
import 'package:shoely_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shoely_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:shoely_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:shoely_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:shoely_dashboard/core/services/database_services.dart';
import 'package:shoely_dashboard/core/services/file_storage.dart';
import 'package:shoely_dashboard/core/services/firestore_services.dart';
import 'package:shoely_dashboard/core/services/storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(FileStorage());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageServices: getIt.get<StorageServices>()),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseServices: getIt.get<DatabaseServices>()),
  );
}
