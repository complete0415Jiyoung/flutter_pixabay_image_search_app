import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/routing/routes.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/image_list_view_model.dart';
import 'package:go_router/go_router.dart';

class ImageListPage extends StatefulWidget {
  final ImageListViewModel viewModel;
  const ImageListPage({super.key, required this.viewModel});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Search bar
                  TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        widget.viewModel.fetchImages(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '검색어를 입력하세요',

                      suffixIcon: Icon(Icons.search, color: Colors.teal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Grid of images
                  if (widget.viewModel.state.isLoading)
                    Center(child: CircularProgressIndicator())
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
                        'No images found',
                        style: TextStyle(color: Colors.grey),
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
