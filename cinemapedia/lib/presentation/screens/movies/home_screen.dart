import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvier.notifier).loadNextPage();
    ref.read(getUpcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlidesProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMoviesNow = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvier);
    final upComingMovies = ref.watch(getUpcomingMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace:
            FlexibleSpaceBar(centerTitle: true, title: CustomAppbar()),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(children: [
            MoviesSlideShow(movies: slideShowMovies),
            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'En cines',
              subtitle: 'Today',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: popularMoviesNow,
              title: 'Populares',
              subtitle: 'Today',
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: topRatedMovies,
              title: 'Top Rated',
              subtitle: 'Today',
              loadNextPage: () {
                ref.read(topRatedMoviesProvier.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: upComingMovies,
              title: 'Proximamente',
              subtitle: 'Today',
              loadNextPage: () {
                ref.read(getUpcomingMoviesProvider.notifier).loadNextPage();
              },
            )
          ]);
        },
        childCount: 1,
      ))
    ]);
  }
}
