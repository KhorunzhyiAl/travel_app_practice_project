import 'package:travel_app/Api/Place.dart';

class Data {
  static const recommendations = <Place>[
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

  static const trending = <Place>[
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
}
