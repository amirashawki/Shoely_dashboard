import 'package:go_router/go_router.dart';
import 'package:shoely_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:shoely_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

abstract class AppRouter {
  static final kSingUpView = '/signup';
  static final kLoginView = '/LoginView';
  static final kHomeView = '/HomeView';
  static final kProfileView = '/ProfileView';
  static final kAddProductView = '/AddProductView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return DashboardView();
        },
      ),
      GoRoute(
        path: kAddProductView,
        builder: (context, state) {
          return AddProductView();
        },
      ),
    ],
  );
}
