import 'package:flutter/material.dart';
import 'package:travel_app/MyWidgets/SearchBar.dart';

class SearchBarPage extends StatelessWidget {
  final Key searchBarTag;

  SearchBarPage({required this.searchBarTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(200),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black45,
        elevation: 5,
        leading: null,
        leadingWidth: 0,
        toolbarHeight: 70,
        title: Hero(
          tag: searchBarTag,
          child: Material(
            color: Colors.transparent,
            child: SearchBar(
              onSelected: () {},
              focus: true,
              readonly: false,
            ),
          ),
        ),
      ),
    );
  }
}
