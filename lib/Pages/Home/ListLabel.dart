import 'package:flutter/material.dart';

class ListLabel extends StatelessWidget {
  final String labelText;
  final Function? onPressed;

  ListLabel({required this.labelText, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // This is completely useless, but the original design has this
          // and it also makes the page look more complete so I'm leaving 
          // it here.
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
