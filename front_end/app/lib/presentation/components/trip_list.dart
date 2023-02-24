import 'package:app/assistant/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/static_data.dart';

class TripList extends StatelessWidget {
  TripList({super.key});
  final List<dynamic> trips = Data.trip_list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trips.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: kBoxDecoration,
                  // decoration: kBoxDecoration,
                  //height: double.minPositive,

                  ///  MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              trips[index]["trip_name"],
                              style: GoogleFonts.balooBhaijaan2(
                                  textStyle: const TextStyle(
                                      color: Color(0xff6F6767),
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Text(
                          "${trips[index]["expenses"]}/${trips[index]["budget"]} \$",
                          style: GoogleFonts.balooBhaijaan2(
                              textStyle: const TextStyle(
                                  color: Color(0xff6F6767),
                                  letterSpacing: 0.5,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                            "${trips[index]["date_start"]}--${trips[index]["date_end"]} ")
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
