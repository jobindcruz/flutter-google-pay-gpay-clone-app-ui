import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gpay/data/discover_business.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverBusiness extends StatelessWidget {
  const DiscoverBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#d1d1d1'),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      discoverB[index].imageUrl,
                    ),
                    alignment: Alignment.topCenter),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 70),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: HexColor('#ffffff'),
                        border: Border.all(
                          color: HexColor('#d1d1d1'),
                          width: 0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            discoverB[index].title,
                            style: GoogleFonts.cabin(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            discoverB[index].discription,
                            style: GoogleFonts.cabin(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 13,
                    child: Align(
                      alignment: Alignment(-0.7, 0.7),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(discoverB[index].avatarUrl),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      itemCount: discoverB.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 10),
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
    );
  }
}
