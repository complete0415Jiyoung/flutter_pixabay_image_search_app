import 'package:flutter_pixabay_image_search_app/core/di/di_setup.dart';
import 'package:flutter_pixabay_image_search_app/core/routing/routes.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/photo_detail_screen.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/photo_search_screen.dart';

import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.searchImage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (
        context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return navigationShell;
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.searchImage,
              builder:
                  (context, state) => PhotoSearchScreen(viewModel: getIt()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.searchImageDetail,
      name: 'imageDetail',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ImageDetailPage(id: id, viewModel: getIt());
      },
    ),
  ],
);
