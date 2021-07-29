import 'package:flutter/material.dart';
import 'package:travel_app/Pages/Home/RecommendedPlaceWidget.dart';
import 'package:travel_app/Pages/Home/TrendingPlaceWidget.dart';
import 'package:travel_app/Api/Place.dart';
import 'package:travel_app/Pages/PlaceDetails/PlacePage.dart';

class HomePage extends StatelessWidget {
  final recommendations = <Place>[
    Place(
      city: 'Venice',
      country: 'Italy',
      imageUrl: 'https://wallpaperaccess.com/full/3150434.jpg',
    ),
    Place(
      city: 'New York',
      country: 'USA',
      imageUrl:
          'https://i.pinimg.com/originals/e5/2e/90/e52e90e44c10ed94daa14174ebc2ed02.jpg',
    ),
    Place(
      city: 'Idk',
      country: 'Iceland',
      imageUrl: 'https://wallpaperaccess.com/full/202797.jpg',
    ),
  ];

  final trending = <Place>[
    Place(
      city: 'idk',
      country: 'Iceland',
      imageUrl: 'https://wallpaperaccess.com/full/202797.jpg',
    ),
    Place(
      city: 'Venice',
      country: 'Italy',
      imageUrl: 'https://wallpaperaccess.com/full/3150434.jpg',
    ),
    Place(
      city: 'New York',
      country: 'USA',
      imageUrl:
          'https://i.pinimg.com/originals/e5/2e/90/e52e90e44c10ed94daa14174ebc2ed02.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        backwardsCompatibility: false,
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          iconSize: 30,
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: AspectRatio(
              aspectRatio: 1,
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: InkResponse(
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Big label
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'Where do you want to go?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),

          // Search bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox.fromSize(size: Size.fromWidth(15)),
                  Icon(Icons.manage_search, color: Colors.grey.shade600),
                  SizedBox.fromSize(size: Size.fromWidth(15)),
                  Text(
                    'Search...',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Recommendations
          Expanded(
            child: Container(
              child: Column(
                children: [
                  // Recommended label
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz),
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),

                  // Recommended list
                  Expanded(
                    child: ListView.separated(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 100,
                      itemBuilder: (_, index) {
                        Key heroTag = UniqueKey();
                        return RecommendedPlaceWidget(
                          place: recommendations[index],
                          imageHeroTag: heroTag,
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, _, __) {
                                  return PlacePage(
                                    place: recommendations[index],
                                    imageHeroTag: heroTag,
                                  );
                                },
                                transitionsBuilder:
                                    (context, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, __) {
                        return SizedBox.fromSize(size: Size.fromWidth(30));
                      },
                      itemCount: recommendations.length,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Trending
          Container(
            child: Column(
              children: [
                // Label
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Trending this week',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),

                // List
                Container(
                  height: 100,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      Key imageHeroTag = UniqueKey();
                      return TrendingPlaceWidget(
                        place: trending[index],
                        imageHeroTag: imageHeroTag,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, _, __) {
                                return PlacePage(
                                  place: recommendations[index],
                                  imageHeroTag: imageHeroTag,
                                );
                              },
                              transitionsBuilder:
                                  (context, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox.fromSize(size: Size.fromWidth(30));
                    },
                    itemCount: trending.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
