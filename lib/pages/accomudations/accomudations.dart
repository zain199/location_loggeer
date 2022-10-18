import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/config.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({Key? key}) : super(key: key);

  @override
  State<Accommodation> createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.maxFinite,
          color: Config().appaccentColor,
          child: SafeArea(
            child: Row(
              children: [
                Text(
                  'Location Logger',
                  style: GoogleFonts.akayaTelivigala(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg'),
                )
              ],
            ),
          ),
        ),
        Center(child: Text('accommodations'),)
      ],
    );
  }
}
