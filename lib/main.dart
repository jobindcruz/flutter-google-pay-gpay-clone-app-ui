// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gpay/components/peoples_home.dart';
import 'package:gpay/components/business_home.dart';
import 'package:gpay/components/discover_business_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> businessList = [
    'Bills',
    'Recharge',
    'DTH/Cable',
    'Google Play Store',
    'Electricity'
  ];

  bool fabIsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#e3deff"),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: HexColor("#e3deff")),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedOpacity(
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text(
            'New payment',
            style: GoogleFonts.cabin(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[700],
        ),
        duration: Duration(milliseconds: 10),
        opacity: fabIsVisible ? 1 : 0,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              SlidingSheet(
                  elevation: 0,
                  cornerRadius: 16,
                  addTopViewPaddingOnFullscreen: true,
                  liftOnScrollHeaderElevation: 12.0,
                  liftOnScrollFooterElevation: 0.0,
                  cornerRadiusOnFullscreen: 0.0,
                  snapSpec: const SnapSpec(
                    // Enable snapping. This is true by default.
                    snap: true,
                    // Set custom snapping points.
                    snappings: [0.65, 0.7, SnapSpec.expanded],
                    // Define to what the snappings relate to. In this case,
                    // the total available space that the sheet can expand to.
                    positioning: SnapPositioning.relativeToAvailableSpace,
                  ),
                  listener: (state) {
                    //print(state.isAtBottom);
                    /*if (state.isAtBottom == true) {
                      setState(() {
                        fabIsVisible = !state.isAtBottom;
                      });
                    } else if (fabIsVisible == false) {
                      setState(() {
                        fabIsVisible = true;
                      });
                    }*/
                  },
                  body: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: _scan_qr(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://randomuser.me/api/portraits/women/60.jpg'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: HexColor("#e3deff"),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/4988790.jpg",
                              ),
                              scale: 3.5)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                    ),
                  ]),
                  builder: (context, state) {
                    // This is the content of the sheet that will get
                    // scrolled, if the content is bigger than the available
                    // height of the sheet.
                    return Container(
                      padding: EdgeInsets.all(0),
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'People',
                                style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: HexColor('#262626'))),
                              ),
                            )),
                        SizedBox(height: 20),
                        PeoplesHome(),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Business and bills",
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: HexColor('#262626'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      color: HexColor('#2a73e9'),
                                      size: 20.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                    Text(
                                      'Expolre',
                                      style: GoogleFonts.cabin(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: HexColor('#2a73e9'))),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(
                                  color: HexColor('#e7f0ff'),
                                  border: Border.all(
                                    color: HexColor('#e7f0ff'),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 40,
                            child: Expanded(
                              child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: businessList.length,
                                itemBuilder: (context, index) {
                                  return _businessTags(businessList[index]);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        BusineesHome(),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Discover businesses",
                              style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: HexColor('#262626'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                margin: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'For you',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: HexColor('#2a73e9'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(
                                  color: HexColor('#e7f0ff'),
                                  border: Border.all(
                                    color: HexColor('#dce8fc'),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Nearby',
                                      style: GoogleFonts.cabin(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: HexColor('#545353'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: HexColor('#f0f0f0'),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: DiscoverBusiness(),
                        ),
                        Container(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'See All',
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: HexColor('#2a73e9'),
                                  ),
                                ),
                              )
                            ],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#f0f0f0'),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Promotions",
                              style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: HexColor('#262626'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(0),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 20,
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          children: <Widget>[
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons.flaticon.com/png/128/4312/premium/4312985.png?token=exp=1636284958~hmac=b596f4d9c22bab7fb05fba821d2b35f3"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Rewards",
                                    style: GoogleFonts.cabin(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/128/3176/3176371.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Offers",
                                    style: GoogleFonts.cabin(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/128/2037/2037280.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Refferals",
                                    style: GoogleFonts.cabin(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://cdn-icons-png.flaticon.com/128/1114/1114220.png")),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Fan Wall",
                                    style: GoogleFonts.cabin(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.access_time_sharp,
                            size: 25,
                            color: Colors.blue[600],
                          ),
                          title: Text(
                            'Show transaction history',
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(fontWeight: FontWeight.w500),
                              fontSize: 17,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.account_balance_outlined,
                            size: 25,
                            color: Colors.blue[600],
                          ),
                          title: Text(
                            'View account balance',
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(fontWeight: FontWeight.w500),
                              fontSize: 17,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.payments_rounded,
                            size: 25,
                            color: Colors.blue[600],
                          ),
                          title: Text(
                            'Regular payments',
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(fontWeight: FontWeight.w500),
                              fontSize: 17,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          subtitle: Text("1 upcoming payment"),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 400,
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.freepik.com/free-vector/followers-line-concept-illustration_52683-23650.jpg',
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          child: Column(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              child: Text(
                                'Invite your friends to Google Pay',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#383838'),
                                    fontSize: 16,
                                  ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Text(
                              'Invite your friends to Google Pay and get 175 when your friend sends their \nfirst payment. They get 21',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#383838'),
                                    fontSize: 14,
                                    height: 1.6),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Text("Copy your code "),
                                Text(
                                  "7j3a7",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                  child: Icon(
                                    Icons.copy_rounded,
                                    size: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Invite',
                                        style: GoogleFonts.cabin(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.grey.shade900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9, vertical: 9),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor('#f0f0f0'),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ]),
                        )
                      ]),
                    );
                  })
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

_businessTags(name) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              width: 18,
              image: AssetImage(
                "assets/bills.png",
              ),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.cabin(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black87)),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: HexColor('#ffffff'),
        border: Border.all(
          color: HexColor('#d1d1d1'),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
_scan_qr() {
  return Container(
    width: 140,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.blue,
          size: 20.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        Text(
          'Scan any QR',
          style: GoogleFonts.cabin(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black54)),
        )
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.blueGrey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 0.40,
        ),
      ],
    ),
  );
}
