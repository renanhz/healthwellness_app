import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/exam_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:intl/intl.dart';

class ExamScreen extends StatefulWidget {
  @override
  ExamScreenState createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen> {
  LangBloc langBloc;
  ExamBloc examBloc;

  @override
  void initState() {
    super.initState();
    this.langBloc = BlocProvider.getBloc<LangBloc>();
    this.examBloc = BlocProvider.getBloc<ExamBloc>();
  }

  @override
  Widget build(BuildContext mainContext) {
    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (langContext, snapshot) {
        return Stack(
          children: [
            Container(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 25.0, bottom: 25.0),
                child: FloatingActionButton(
                  elevation: 2.0,
                  onPressed: () {
                    showDialog(
                      context: mainContext,
                      builder: (context) {
                        return this
                            .newExamDiaglog(mainContext, Locale(snapshot.data));
                      },
                    );
                  },
                  backgroundColor: Colors.red[600],
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget newExamDiaglog(BuildContext mainContext, Locale locale) {
    return Dialog(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(mainContext).newExam,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextField(
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        labelText: S.of(mainContext).name,
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      onChanged: (String text) {
                        examBloc.inName.add(text);
                        examBloc.checkButtonState();
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: StreamBuilder(
                            initialData: DateTime.now(),
                            stream: examBloc.outCreationDate,
                            builder: (context, snapshot) {
                              String formattedDate = DateFormat('dd/MM/yyyy')
                                  .format(snapshot.data);
                              return Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            S.of(mainContext).pickDate,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.red[600],
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.grey[350],
                          padding: EdgeInsets.all(5.0),
                          onPressed: () async {
                            DateTime date = await showDatePicker(
                                locale: locale,
                                context: mainContext,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now());

                            if (date != null) {
                              examBloc.inCreationDate.add(date);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
