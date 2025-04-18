import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/color_styles.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/text_styles.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/image_detail_view_model.dart';
import 'package:go_router/go_router.dart';

class ImageDetailPage extends StatefulWidget {
  final int id;
  final ImageDetailViewModel viewModel;

  const ImageDetailPage({super.key, required this.id, required this.viewModel});

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  void initState() {
    super.initState();
    // 상태 변경 감지해서 setState() 호출
    widget.viewModel.addListener(_onViewModelChanged);
    widget.viewModel.fetchImage(widget.id);
  }

  @override
  void dispose() {
    // 리스너 해제
    widget.viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    setState(() {}); // 상태가 바뀔 때 UI 갱신
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.viewModel.state;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/image'),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (_, __) {
          if (state.isLoading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: ColorStyle.gray4,
                    strokeWidth: 3,
                  ),
                  SizedBox(height: 12),
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
                widget.viewModel.state.errorMessage,
                style: TextStyle(color: Colors.red),
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
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    photo.largeImageURL,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                ],
                if (photo.tags.isNotEmpty) ...[
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
                                      color: ColorStyle.primary100, // 글자색
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
