import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/shopping_list/presentation/pages/shopping_list_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../shell/app_shell.dart';
import '../../features/products/presentation/pages/create_product_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) {
                return const DashboardPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/products',
              name: 'products',
              builder: (context, state) {
                return const ProductsPage();
              },
              routes: [
                GoRoute(
                  path: 'create',
                  name: 'create-product',
                  builder: (context, state) {
                    return const CreateProductPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
