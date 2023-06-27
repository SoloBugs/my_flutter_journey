import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.label,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
