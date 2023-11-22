
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      const Text('Build Actions')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('builLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions: $query');
  }

}