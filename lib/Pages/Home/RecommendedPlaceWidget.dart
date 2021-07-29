import 'package:flutter/material.dart';
import 'package:travel_app/Api/Place.dart';

class RecommendedPlaceWidget extends StatelessWidget {
  final Place place;
  final Function? onPressed;
  final Key imageHeroTag; // For the Hero widget

  RecommendedPlaceWidget(
      {required this.place, this.onPressed, required this.imageHeroTag});

  @override
  Widget build(BuildContext context) {
    final borderRadius = 40.0;

    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Hero(
        tag: imageHeroTag,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(place.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.blue.shade100,
            ),
            child: InkWell(
              onTap: () {
                onPressed?.call();
              },
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      place.city,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      place.country,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey.shade50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
