import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  String filter = "";
  Body({Key? key, required this.filter}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List? appointments = [
    {
      "id": 1,
      "name": "Appointment 1",
      "date": "December 25th",
      "places": 4,
      "BloodType": "A+",
    },
    {
      "id": 2,
      "name": "Appointment 2",
      "date": "December 26th",
      "places": 3,
      "BloodType": "B+",
    },
    {
      "id": 3,
      "name": "Appointment 3",
      "date": "December 27th",
      "places": 1,
      "BloodType": "O-",
    },
  ];

  final Stream<QuerySnapshot?>? BloodTypes =
      FirebaseFirestore.instance.collection("BloodTypes").snapshots();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments!.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(appointments![i]["BloodType"]),
            leading: Text(
              appointments![i]["places"].toString() + " places",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
        );
      },
    );
  }
}
