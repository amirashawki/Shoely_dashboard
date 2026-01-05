import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_dashboard/core/services/bloc_observer_services.dart';
import 'package:shoely_dashboard/core/services/get_it_services.dart';
import 'package:shoely_dashboard/core/services/supabase_storage.dart';
import 'package:shoely_dashboard/core/utils/app_router.dart';
import 'package:shoely_dashboard/core/utils/backend_endpoint.dart';
import 'package:shoely_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  Bloc.observer = AppBlocObserver();
  await SupabaseStorageServices.initSupabase();
  await SupabaseStorageServices.createBuckets(BackendEndpoint.bucketName);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const MainApp();
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouter.router);
  }
}
