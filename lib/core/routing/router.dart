import 'package:flutter_pixabay_image_search_app/core/routing/routes.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/image_detail_page.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/image_list_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.imageList,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.imageList,
      builder: (context, state) => const ImageListPage(),
    ),
    GoRoute(
      path: Routes.imageDetail, // '/image/:id'
      name: 'imageDetail',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        return ImageDetailPage(id: id);
      },
    ),
  ],
);
