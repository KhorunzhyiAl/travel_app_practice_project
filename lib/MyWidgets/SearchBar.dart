import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function onSelected;
  final bool focus;
  final bool readonly;

  SearchBar({
    required this.onSelected,
    this.focus = false,
    this.readonly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        onSelected();
      },
      readOnly: this.readonly,
      autofocus: this.focus,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        icon: Icon(Icons.search),
        hintText: 'Search...',
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9999),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
