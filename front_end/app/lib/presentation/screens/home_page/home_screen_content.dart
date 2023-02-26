import 'package:app/assistant/global.dart';
import 'package:flutter/material.dart';

import '../../../data/user_model.dart';
import '../../components/trip_list.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    final User user = User.getConnectedUSer();
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
          height: MediaQuery.of(context).size.width * .9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.03),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: KIconColor,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: KIconColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: (size.width - 40) * 0.6,
                      child: Column(
                        children: [
                          Text(
                            user.fullName,
                            style: kH1TextStyle,
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          Text(
                            user.email,
                            style: kH3TextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "10",
                          style: kH1TextStyle,
                        ),
                        Text(
                          "Trips",
                          style: kH3TextStyle,
                        ),
                      ],
                    ),
                    Container(
                      width: 0.5,
                      height: 40,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    Column(
                      children: [
                        Text(
                          "\$5500",
                          style: kH1TextStyle,
                        ),
                        Text(
                          "Expenses",
                          style: kH3TextStyle,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trips :",
                style: kH1TextStyle,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort,
                    color: KIconColor,
                    size: 25,
                  ))
            ],
          ),
        ),
        SafeArea(child: TripList())
      ],
    ));
  }
}
