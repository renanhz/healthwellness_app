import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:healthwellness/bloc/lang_bloc.dart';

class ExamScreen extends StatefulWidget {
  @override
  ExamScreenState createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen> {
  LangBloc langBloc;

  @override
  void initState() {
    super.initState();
    this.langBloc = BlocProvider.getBloc<LangBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
