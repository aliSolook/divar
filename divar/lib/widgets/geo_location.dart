import 'package:divar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GeoLocation extends StatelessWidget {
  const GeoLocation({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.381944444444444,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(36.8211618, 54.4354989),
                  initialZoom: 15,
                  interactionOptions: InteractionOptions(
                    flags: InteractiveFlag.none,
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  Center(
                    child: SizedBox(
                      width: constraints.maxWidth *
                          0.53935860058309037900874635568513,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsetsDirectional.only(
                            start: 16,
                            end: 8,
                            top: 8,
                            bottom: 8,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                text,
                                style: const TextStyle(
                                    fontFamily: DefaultFonts.regular,
                                    fontSize: 16,
                                    color: DefaultColors.white,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Image(
                              width: 24,
                              image:
                                  AssetImage('assets/images/location_icon.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
