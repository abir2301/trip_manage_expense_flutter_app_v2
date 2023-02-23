import 'package:app/assistant/global.dart';
import 'package:flutter/material.dart';

import '../../../data/user_model.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
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
                padding: const EdgeInsets.only(
                    top: 20, bottom: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
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
                    SizedBox(
                      height: 15,
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
                                "Abbie Wilson",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kGrey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Software Developer",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "\$8900",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kGrey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Container(
                          width: 0.5,
                          height: 40,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$5500",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kGrey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Expenses",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Container(
                          width: 0.5,
                          height: 40,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$890",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kGrey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Loan",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
