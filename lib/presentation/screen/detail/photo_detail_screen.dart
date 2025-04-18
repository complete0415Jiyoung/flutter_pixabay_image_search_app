import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/color_styles.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/text_styles.dart';
import 'package:flutter_pixabay_image_search_app/presentation/component/skeleton_image.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/photo_detail_view_model.dart';
import 'package:go_router/go_router.dart';

class ImageDetailPage extends StatelessWidget {
  final int id;
  final PhotoDetailViewModel viewModel;

  const ImageDetailPage({super.key, required this.id, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // 처음 한 번만 수행되게 Future.microtask 사용
    Future.microtask(() => viewModel.fetchImage(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (_, __) {
          final state = viewModel.state;

          if (state.isLoading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: ColorStyle.gray4,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "불러오는 중...",
                    style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                  ),
                ],
              ),
            );
          }

          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final photo = state.photo;
          if (photo == null) {
            return Center(
              child: Text(
                '이미지를 찾을 수 없습니다🥲',
                style: AppTextStyles.mediumRegular(color: ColorStyle.gray3),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonImage(
                  imageUrl: photo.largeImageURL,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                if (photo.tags.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '사진 제공자',
                              style: AppTextStyles.normalBold(
                                color: ColorStyle.gray1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              photo.userName,
                              style: AppTextStyles.normalBold(
                                color: ColorStyle.gray1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.spaceBetween,
                      children:
                          photo.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorStyle.primary40,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: ColorStyle.primary100,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Text(
                                    tag.trim(),
                                    style: AppTextStyles.smallRegular(
                                      color: ColorStyle.primary100,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
