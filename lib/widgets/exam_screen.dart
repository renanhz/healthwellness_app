import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/exam_bloc.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';
import 'package:healthwellness/generated/l10n.dart';
import 'package:healthwellness/models/exam_model.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:healthwellness/widgets/exam_card.dart';
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

    this.examBloc.downloadExamList();
  }

  @override
  Widget build(BuildContext mainContext) {
    return StreamBuilder(
      initialData: 'en',
      stream: langBloc.outLocale,
      builder: (langContext, snapshot) {
        return Stack(
          children: [
            StreamBuilder(
              stream: examBloc.outExamListState,
              builder: (context, snapshot) {
                if (snapshot.data == ExamListState.LOADING) {
                  return Center(
                    heightFactor: 2,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.red[600]),
                    ),
                  );
                } else if (snapshot.data == ExamListState.FAIL) {
                  return Center(
                    heightFactor: 2,
                    child: Text(
                      S.of(mainContext).downloadExamListError,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                  );
                } else if (snapshot.data == ExamListState.SUCCESS) {
                  return StreamBuilder(
                    initialData: [],
                    stream: examBloc.outExamList,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return getExamCard(mainContext, snapshot.data[index]);
                        },
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
      child: SingleChildScrollView(
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
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
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
                              border:
                                  Border.all(color: Colors.black, width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: StreamBuilder(
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
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.centerLeft,
                          child: StreamBuilder(
                            stream: examBloc.outFileName,
                            initialData: "",
                            builder: (context, snapshot) {
                              return Text(
                                "${S.of(mainContext).fileName}: ${snapshot.data}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.upload_file,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  Text(
                                    S.of(mainContext).pickFile,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              color: Colors.red[600],
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.grey[350],
                              padding: EdgeInsets.all(5.0),
                              onPressed: () async {
                                await examBloc.selectFile();
                                examBloc.checkButtonState();
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: StreamBuilder(
                              initialData: true,
                              stream: examBloc.outButtonState,
                              builder: (context, snapshot) {
                                return RaisedButton(
                                  child: Text(
                                    S.of(mainContext).createExam,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.red[600],
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.grey[350],
                                  padding: EdgeInsets.all(5.0),
                                  onPressed: snapshot.data
                                      ? null
                                      : () async {
                                          await examBloc.save();
                                        },
                                );
                              },
                            ),
                          ),
                        ),
                        StreamBuilder(
                          stream: examBloc.outNewExamState,
                          builder: (context, snapshot) {
                            if (snapshot.data == NewExamState.LOADING) {
                              return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Center(
                                    heightFactor: 2,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.red[600]),
                                    ),
                                  ));
                            } else if (snapshot.data == NewExamState.FAIL) {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  S.of(mainContext).newExamError,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                  ),
                                ),
                              );
                            } else if (snapshot.data == NewExamState.SUCCESS) {
                              Navigator.pop(mainContext);
                            }

                            return Container(
                              width: 0.0,
                              height: 0.0,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
