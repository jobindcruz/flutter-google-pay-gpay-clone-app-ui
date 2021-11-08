import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/data/business.dart';
import 'package:gpay/extensions.dart';

class BusineesHome extends StatelessWidget {
  const BusineesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
        ),
        itemCount: businessLists.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 10),
        physics: const ScrollPhysics(),
        itemBuilder: (context, i) {
          if (businessLists[i].businessUrl == '') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 2,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    businessLists[i].name[0],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      truncateString(businessLists[i].name, 10),
                      style: GoogleFonts.cabin(
                          textStyle: const TextStyle(fontSize: 18)),
                    ))
              ],
            );
          }

          if (i == 0) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(businessLists[i].businessUrl),
                  child: Stack(children: const [
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.blue,
                          )),
                    ),
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      truncateString(businessLists[i].name, 11),
                      style: GoogleFonts.cabin(
                          textStyle: const TextStyle(fontSize: 18)),
                    ))
              ],
            );
          }

          if (i == 11) {
            return Column(
              children: [
                const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.black45,
                        size: 30.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "More",
                      style: GoogleFonts.cabin(
                          textStyle: const TextStyle(fontSize: 18)),
                    ))
              ],
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 2,
              ),
              CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(businessLists[i].businessUrl)),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    truncateString(businessLists[i].name, 8),
                    style: GoogleFonts.cabin(
                        textStyle: const TextStyle(fontSize: 18)),
                  ))
            ],
          );
        });
  }
}
