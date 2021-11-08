// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/data/peoples.dart';

class PeoplesHome extends StatelessWidget {
  const PeoplesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
        ),
        itemCount: peoplesData.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 10),
        physics: ScrollPhysics(),
        itemBuilder: (context, i) {
          if (peoplesData[i].avatarUrl == '') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    peoplesData[i].name[0],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      peoplesData[i].name,
                      style:
                          GoogleFonts.cabin(textStyle: TextStyle(fontSize: 18)),
                    ))
              ],
            );
          }

          if (i == 0) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(peoplesData[i].avatarUrl),
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
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      peoplesData[i].name,
                      style:
                          GoogleFonts.cabin(textStyle: TextStyle(fontSize: 18)),
                    ))
              ],
            );
          }

          if (peoplesData.length - 1 == i) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.black45,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "More",
                    style:
                        GoogleFonts.cabin(textStyle: TextStyle(fontSize: 18)),
                  ),
                )
              ],
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2,
              ),
              CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(peoplesData[i].avatarUrl)),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    peoplesData[i].name,
                    style:
                        GoogleFonts.cabin(textStyle: TextStyle(fontSize: 18)),
                  ))
            ],
          );
        });
  }
}
