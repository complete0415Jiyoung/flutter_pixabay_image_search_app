import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/color_styles.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/text_styles.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/photo_search_view_model.dart';

import 'package:go_router/go_router.dart';

class PhotoSearchScreen extends StatefulWidget {
  final PhotoSearchViewModel viewModel;
  const PhotoSearchScreen({super.key, required this.viewModel});

  @override
  State<PhotoSearchScreen> createState() => _PhotoSearchScreenState();
}

class _PhotoSearchScreenState extends State<PhotoSearchScreen> {
  TextEditingController? _searchController; // nullable 상태로 선언

  @override
  void initState() {
    super.initState();

    // TextEditingController 초기화 상태를 확인하고 설정
    final currentKeyword = widget.viewModel.state.currentKeyword;
    _searchController = TextEditingController(
      text: currentKeyword.isNotEmpty ? currentKeyword : null,
    );

    // 초기 검색어가 있으면 자동으로 검색 실행
    if (currentKeyword.isNotEmpty) {
      _searchImages(currentKeyword);
    }
  }

  @override
  void dispose() {
    _searchController?.dispose(); // 초기화가 확실치 않으므로 null 체크
    super.dispose();
  }

  void _searchImages(String query) {
    if (query.isNotEmpty) {
      widget.viewModel.fetchImages(query);
    }
  }

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
                    controller: _searchController,
                    onSubmitted: (value) {
                      _searchImages(value);
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
                      child: SizedBox(
                        child: Text(
                          widget.viewModel.state.errorMessage,
                          style: AppTextStyles.normalRegular(
                            color: ColorStyle.gray3,
                          ),
                        ),
                      ),
                    )
                  else if (widget.viewModel.state.imageList.isEmpty)
                    Center(
                      child: Text(
                        '이미지를 검색해주세요',
                        style: AppTextStyles.normalRegular(
                          color: ColorStyle.gray3,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        itemCount: widget.viewModel.state.imageList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final image = widget.viewModel.state.imageList[index];
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(
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
