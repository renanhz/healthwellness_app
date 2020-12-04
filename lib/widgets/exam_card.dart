import 'package:flutter/material.dart';
import 'package:healthwellness/models/exam_model.dart';

Widget getExamCard(BuildContext mainContext, ExamModel exam) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    elevation: 4.0,
    child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                exam.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                exam.creationDate,
                style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
