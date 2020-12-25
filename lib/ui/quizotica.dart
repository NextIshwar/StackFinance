import 'package:SFinance/bloc/bloc.dart';
import 'package:SFinance/bloc/events.dart';
import 'package:SFinance/bloc/states.dart';
import 'package:SFinance/ui/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Quizotica extends StatefulWidget {
  @override
  _QuizoticaState createState() => _QuizoticaState();
}

class _QuizoticaState extends State<Quizotica> {
  int score;
  List<int> groupValue = new List<int>(4);
  Map<String, int> mp = new Map<String, int>();
  @override
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      groupValue[i] = -1;
    }
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<QuestionsBloc>(
      create: (context) => QuestionsBloc()..add(QuizStartEvent()),
      child: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (_, state) => SafeArea(
          child: Container(
              height: height * 0.9,
              width: width * 1,
              color: Colors.white,
              child: (state is QuizStartState)
                  ? SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          state.questions.length + 1,
                          (index) => (index <= state.questions.length - 1)
                              ? Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${index + 1}) ${state.questions[index]["Question"].toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                            4,
                                            (i) => RadioListTile(
                                                title: Text(
                                                    state.questions[index]
                                                            ["Option${i + 1}"]
                                                        ["option"]),
                                                value: i,
                                                groupValue: groupValue[index],
                                                onChanged: (val) {
                                                  setState(() {
                                                    groupValue[index] = val;
                                                    score += state.questions[
                                                                index]
                                                            ["Option${i + 1}"]
                                                        ["score"];
                                                  });
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultCard(score)),
                                    );
                                  },
                                  child: Text("Submit"),
                                ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
        ),
      ),
    );
  }
}
