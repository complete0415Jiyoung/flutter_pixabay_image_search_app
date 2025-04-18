import 'package:flutter_pixabay_image_search_app/core/routing/routes.dart';
import 'package:flutter_pixabay_image_search_app/data/data_source/photo_data_source_impl.dart';
import 'package:flutter_pixabay_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/image_detail_page.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/image_detail_view_model.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/image_list_page.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/image_list_view_model.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.imageList,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.imageList,
      builder:
          (context, state) => ImageListPage(
            viewModel: ImageListViewModel(
              PhotoRepositoryImpl(PhotoDataSourceImpl()),
            ),
          ),
    ),
    GoRoute(
      path: Routes.imageDetail, // '/image/:id'
      name: 'imageDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']; // id는 String 타입
        return ImageDetailPage(
          id: int.parse(id!),
          viewModel: ImageDetailViewModel(
            PhotoRepositoryImpl(PhotoDataSourceImpl()),
          ),
        );
      },
    ),
  ],
);
