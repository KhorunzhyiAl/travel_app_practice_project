import 'package:flutter/material.dart';
import 'package:travel_app/Api/Place.dart';

class PlacePage extends StatelessWidget {
  final Place place;
  final Key imageHeroTag;

  PlacePage({required this.place, required this.imageHeroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.transparent,
              child: Hero(
                tag: imageHeroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image(
                    image: NetworkImage(place.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            // the rest of the content
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      place.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.blue,
                      height: 90,
                    ),
                    Spacer(),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade400),
                          elevation: MaterialStateProperty.all<double>(10),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                        ),
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
