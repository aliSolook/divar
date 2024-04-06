import 'dart:math';

import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/poster_view_screen.dart';

class Poster {
  final String title;
  final String description;
  final String cityName;
  final PosterCategory category;
  final int meterage;
  final int rooms;
  final int floor;
  final int yearOfConstruction;
  final ImageProvider image;
  final DateTime dateCreated;
  final int pricePerMeter;
  final List<PosterOptions> options;
  final PosterFloorMaterial floorMaterial;
  final PosterBuildingDirection buildingDirection;

  Poster({
    required this.title,
    required this.description,
    required this.cityName,
    required this.category,
    required this.meterage,
    required this.rooms,
    required this.floor,
    required this.yearOfConstruction,
    required this.image,
    required this.pricePerMeter,
    this.options = const [],
    this.buildingDirection = PosterBuildingDirection.north,
    this.floorMaterial = PosterFloorMaterial.ceramic,
  }) : dateCreated = DateTime.now().subtract(
          Duration(minutes: Random().nextInt(29) + 1),
        );

  Poster._({
    required this.title,
    required this.description,
    required this.cityName,
    required this.category,
    required this.meterage,
    required this.rooms,
    required this.floor,
    required this.yearOfConstruction,
    required this.image,
    required this.dateCreated,
    required this.pricePerMeter,
    required this.floorMaterial,
    required this.buildingDirection,
    required this.options,
  });

  factory Poster.copy(Poster poster) {
    return Poster._(
      title: poster.title,
      description: poster.description,
      cityName: poster.cityName,
      category: poster.category,
      meterage: poster.meterage,
      rooms: poster.rooms,
      floor: poster.floor,
      yearOfConstruction: poster.yearOfConstruction,
      image: poster.image,
      dateCreated: poster.dateCreated,
      pricePerMeter: poster.pricePerMeter,
      floorMaterial: poster.floorMaterial,
      buildingDirection: poster.buildingDirection,
      options: poster.options,
    );
  }

  static ({List<Poster> hot, List<Poster> latest}) loadPosters() {
    return (
      hot: [
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_1.png'),
          title: 'ویلا ۵۰۰ متری زیر قیمت',
          description: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
          pricePerMeter: 51366000,
          meterage: 500,
          cityName: 'تهران',
          category: PosterCategory.houseVilla,
          rooms: 4,
          floor: 1,
          yearOfConstruction: 1402,
          options: PosterOptions.values,
        ),
        Poster(
          image: const AssetImage('assets/images/poster_image_2.png'),
          title: 'واحد ۵ خواب متراژ ۲۵۰',
          description: 'دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد',
          pricePerMeter: 51366000,
          meterage: 250,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          floor: 2,
          rooms: 5,
          yearOfConstruction: 1398,
          options: [
            PosterOptions.balcony,
            PosterOptions.elevator,
            PosterOptions.iranianToilet,
            PosterOptions.toilet,
            PosterOptions.sotrageRoom,
            PosterOptions.parking,
          ],
        ),
      ],
      latest: [
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
        Poster(
            image: const AssetImage('assets/images/poster_image_3.png'),
            title: 'واحد دوبلکس فول امکانات',
            description: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
            pricePerMeter: 20500000,
            cityName: 'گرگان',
            category: PosterCategory.houseVilla,
            meterage: 200,
            floor: 2,
            rooms: 3,
            yearOfConstruction: 1398,
            floorMaterial: PosterFloorMaterial.ceramic,
            options: [
              PosterOptions.balcony,
              PosterOptions.iranianToilet,
              PosterOptions.toilet,
              PosterOptions.sotrageRoom,
              PosterOptions.parking,
              PosterOptions.penthouse
            ]),
        Poster(
          image: const AssetImage('assets/images/poster_image_4.png'),
          title: 'پنت هاوس ۳۰۰ متری ناهارخوران',
          description: 'تحویل فوری، ویو عالی به همراه امکانات فول',
          pricePerMeter: 141000000,
          cityName: 'تهران',
          category: PosterCategory.apartment,
          meterage: 600,
          rooms: 5,
          floor: 21,
          yearOfConstruction: 1392,
          options: PosterOptions.values,
          floorMaterial: PosterFloorMaterial.parquet,
        ),
      ],
    );
  }
}

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.poster,
    required this.position,
  });
  final PosterType position;
  final Poster poster;

  @override
  Widget build(BuildContext context) {
    return position.isLandscape
        ? _landscapeBuilder(context)
        : _portraitBuilder(context);
  }

  Widget _container({
    required Widget child,
    required BuildContext context,
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          splashColor: DefaultColors.red.withOpacity(.1),
          highlightColor: DefaultColors.red.withOpacity(.05),
          hoverColor: Colors.transparent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PosterViewScreen(poster: poster),
              ),
            );
          },
          child: Ink(
            decoration: const BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Color.fromRGBO(0, 0, 0, .02),
                  blurRadius: 10,
                ),
                BoxShadow(
                  offset: Offset(0, 18),
                  color: Color.fromRGBO(0, 0, 0, .02),
                  blurRadius: 18,
                ),
                BoxShadow(
                  offset: Offset(0, 40),
                  color: Color.fromRGBO(0, 0, 0, .01),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          poster.title,
          style: const TextStyle(
            fontFamily: DefaultFonts.bold,
            fontSize: 14,
            color: DefaultColors.veryDarkGrey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          poster.description,
          style: const TextStyle(
            fontFamily: DefaultFonts.regular,
            fontSize: 12,
            color: DefaultColors.darkGrey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'قیمت:',
              style: TextStyle(
                fontFamily: DefaultFonts.medium,
                color: DefaultColors.veryDarkGrey,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            DecoratedBox(
              decoration: const BoxDecoration(
                  color: DefaultColors.veryLightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  (poster.pricePerMeter * poster.meterage)
                      .toString()
                      .toPersianNumber()
                      .addSplitters(3, '٬'),
                  style: const TextStyle(
                    fontFamily: DefaultFonts.medium,
                    color: DefaultColors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      child: Image(image: poster.image),
    );
  }

  Widget _portraitBuilder(BuildContext context) {
    return _container(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _image(),
          const SizedBox(height: 16),
          _content(),
        ],
      ),
      width: 224,
    );
  }

  Widget _landscapeBuilder(BuildContext context) {
    return _container(
      context: context,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: _content(),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: _image(),
          ),
        ],
      ),
      height: 139,
    );
  }
}

enum PosterType {
  latest(true),
  hot(false);

  final bool isLandscape;
  const PosterType(this.isLandscape);
}

enum PosterCategory {
  apartment('آپارتمان'),
  houseVilla('خانه و ویلا'),
  land('زمین و کلنگی');

  final String value;
  const PosterCategory(this.value);
}

enum PosterFloorMaterial {
  ceramic('سرامیک'),
  mosaic('موزاییک'),
  parquet('پارکت');

  final String value;
  const PosterFloorMaterial(this.value);
}

enum PosterBuildingDirection {
  north('شمالی'),
  south('جنوبی'),
  west('غرب'),
  east('شرق');

  final String value;
  const PosterBuildingDirection(this.value);
}

enum PosterOptions {
  elevator('آسانسور'),
  parking('پارکینگ'),
  sotrageRoom('انباری'),
  balcony('بالکن'),
  penthouse('پنت هاوس'),
  toilet('فرنگی'),
  iranianToilet('ایرانی');

  final String value;
  const PosterOptions(this.value);
}
