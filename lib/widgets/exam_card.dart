import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/exam_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/models/exam_model.dart';
import 'package:healthwellness/utils/state_enum.dart';

Widget getExamCard(
    BuildContext mainContext, ExamModel exam, ExamBloc examBloc) {
  return GestureDetector(
    onTap: () {
      examBloc.getExamImageUrl(exam.filePath);
      showDialog(
        context: mainContext,
        builder: (context) {
          return examImgDialog(mainContext, examBloc);
        },
      );
    },
    child: Card(
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
    ),
  );
}

Widget examImgDialog(BuildContext mainContext, ExamBloc examBloc) {
  return Dialog(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    child: SingleChildScrollView(
      child: StreamBuilder(
        stream: examBloc.outExamImgState,
        builder: (context, snapshot) {
          if (snapshot.data == ExamImgState.LOADING) {
            return Center(
              heightFactor: 2,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red[600]),
              ),
            );
          } else if (snapshot.data == ExamImgState.FAIL) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                S.of(mainContext).examImgError,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
            );
          } else if (snapshot.data == ExamImgState.SUCCESS) {
            return StreamBuilder(
              stream: examBloc.outFirebaseFilePath,
              builder: (context, snapshot) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Image.network(snapshot.data),
                    ),
                  ],
                );
              },
            );
          }

          return Container(
            width: 0.0,
            height: 0.0,
          );
        },
      ),
    ),
  );
}
