import 'package:app/assistant/global.dart';
import 'package:flutter/material.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, weight: 20, grade: 10),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          "Add Trip",
          style: ktitle,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.80,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 20,
                        image: AssetImage("assets/tower.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera,
                              size: 20,
                            )),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.photo_album))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
