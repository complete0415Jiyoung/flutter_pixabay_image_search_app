import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/image_detail_view_model.dart';
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
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage.isNotEmpty) {
            return Center(child: Text('에러 발생: ${state.errorMessage}'));
          }

          final photo = state.photo;
          if (photo == null) {
            return const Center(child: Text('이미지를 찾을 수 없습니다.'));
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'user : ${photo.userName ?? "Unknown"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'tags : ${photo.tags ?? "No tags"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
