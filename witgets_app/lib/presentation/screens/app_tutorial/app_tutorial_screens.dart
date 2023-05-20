import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo(
      'Selecciona tu Comida Favorita',
      'Eu do quis aliqua mollit labore adipisicing consequat est occaecat deserunt et magna adipisicing proident.',
      'assets/images/1.png'),
  SlidesInfo('Te la llevamos a tu casa', 'Ullamco ut nulla officia consequat.',
      'assets/images/2.png'),
  SlidesInfo('Disfruta la Comida', 'Id sit tempor fugiat duis laborum sit.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slidesData) => _Slide(
                    title: slidesData.title,
                    caption: slidesData.caption,
                    imageUrl: slidesData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 30,
              child: TextButton(
                child: const Text('Saltar'),
                onPressed: () => context.pop(),
              )),
          endReach
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
