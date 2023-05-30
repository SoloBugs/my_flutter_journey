import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNexPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNexPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveItems();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }

  void addFiveItems() {
    final lastId = imagesId.last;

    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removeViewPadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: imagesId.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesId[index]}/500/300'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: SpinPerfect(
            infinite: true, child: const Icon(Icons.refresh_rounded)),
      ),
    );
  }
}
