import 'package:flutter/material.dart';

class StatlessLearn extends StatelessWidget {
final String text2 = 'dataText';

  const StatlessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(text: text2),
          TitleTextWidget(text: "data2"),
          _emptyBox(),
          TitleTextWidget(text: "data3"),
          _emptyBox(),
          TitleTextWidget(text: "data4"),
          _emptyBox(),
          _CostomContainer(),

          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10,);
}

class _CostomContainer extends StatelessWidget {
  const _CostomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget ({super.key, required this.text});
  final String text;

@override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );

  }

}