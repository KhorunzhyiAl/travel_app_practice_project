import 'package:flutter/material.dart';
import 'package:travel_app/Pages/Home/ListLabel.dart';
import 'package:travel_app/Pages/Home/RecommendedPlaceWidget.dart';
import 'package:travel_app/Pages/Home/TrendingPlaceWidget.dart';
import 'package:travel_app/Api/Data.dart';
import 'package:travel_app/Pages/PlaceDetailsPage/PlacePage.dart';
import 'package:travel_app/Api/Place.dart';
import 'package:travel_app/MyWidgets/SearchBar.dart';
import 'package:travel_app/Pages/SearchBarPage.dart';

class HomePage extends StatelessWidget {
  void openPlacePage(Place place, Key imageHeroTag, BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) {
          return PlacePage(
            place: place,
            imageHeroTag: imageHeroTag,
          );
        },
        transitionsBuilder: (context, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void openSearchPage(BuildContext context, Key searchBarTag) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) {
          return SearchBarPage(
            searchBarTag: searchBarTag,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        opaque: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var searchBarTag = UniqueKey();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Hero(
              tag: searchBarTag,
              child: Material(
                color: Colors.transparent,
                child: SearchBar(
                  onSelected: () {
                    openSearchPage(context, searchBarTag);
                  },
                  readonly: true,
                ),
              ),
            ),
          ),

          SizedBox(height: 30),
          // Recommendations
          Expanded(
            child: Column(
              children: [
                // Recommended label
                ListLabel(labelText: 'Recommended'),

                // Recommended list
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 100,
                    itemBuilder: (_, index) {
                      Key imageHeroTag = UniqueKey();
                      return RecommendedPlaceWidget(
                        place: Data.recommendations[index],
                        imageHeroTag: imageHeroTag,
                        onPressed: () {
                          openPlacePage(
                              Data.trending[index], imageHeroTag, context);
                        },
                      );
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox.fromSize(size: Size.fromWidth(30));
                    },
                    itemCount: Data.recommendations.length,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
          // Trending
          Column(
            children: [
              ListLabel(
                labelText: 'Trending this week',
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
                      place: Data.trending[index],
                      imageHeroTag: imageHeroTag,
                      onPressed: () {
                        openPlacePage(
                            Data.trending[index], imageHeroTag, context);
                      },
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox.fromSize(size: Size.fromWidth(30));
                  },
                  itemCount: Data.trending.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
