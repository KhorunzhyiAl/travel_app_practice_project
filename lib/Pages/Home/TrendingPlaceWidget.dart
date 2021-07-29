import 'package:flutter/material.dart';
import 'package:travel_app/Api/Place.dart';

class TrendingPlaceWidget extends StatelessWidget {
  final Place place;
  final Key imageHeroTag;
  final Function? onPressed;
  final double? height;

  TrendingPlaceWidget({
    Key? key,
    required this.place,
    required this.imageHeroTag,
    this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = 20.0;

    return Ink(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey.shade200,
      ),
      child: InkWell(
        onTap: () {
          onPressed?.call();
        },
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.transparent,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: imageHeroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      place.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    place.city,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    place.country,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
