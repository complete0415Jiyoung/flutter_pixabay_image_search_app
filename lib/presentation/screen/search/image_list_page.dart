import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/routing/routes.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/color_styles.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/text_styles.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/image_list_view_model.dart';
import 'package:go_router/go_router.dart';

class ImageListPage extends StatefulWidget {
  final ImageListViewModel viewModel;
  const ImageListPage({super.key, required this.viewModel});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('이미지 검색')),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (_, __) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Search bar
                  TextField(
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        widget.viewModel.fetchImages(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '검색어를 입력하세요',
                      hintStyle: AppTextStyles.smallRegular(
                        color: ColorStyle.gray2,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: ColorStyle.primary100,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorStyle.primary100),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorStyle.primary100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorStyle.primary100),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  if (widget.viewModel.state.isLoading)
                    Center(
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
                            style: AppTextStyles.smallRegular(
                              color: ColorStyle.gray3,
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (widget.viewModel.state.errorMessage.isNotEmpty)
                    Center(
                      child: Text(
                        widget.viewModel.state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  else if (widget.viewModel.state.imageList == null)
                    Center(
                      child: Text(
                        '이미지를 찾을 수 없습니다🥲',
                        style: AppTextStyles.normalRegular(
                          color: ColorStyle.gray3,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        itemCount: widget.viewModel.state.imageList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final image =
                              widget.viewModel.state.imageList![index];
                          return GestureDetector(
                            onTap: () {
                              context.goNamed(
                                'imageDetail',
                                pathParameters: {'id': image.id.toString()},
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                image.largeImageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
