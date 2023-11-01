import 'package:flutter/material.dart';

class UnorderedTextList extends StatelessWidget {
  const UnorderedTextList(this.texts, {super.key});

  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedTextListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 16));
    }

    return Column(children: widgetList);
  }
}

class UnorderedTextListItem extends StatelessWidget {
  const UnorderedTextListItem(this.text, {super.key});

  final String text;

  static const textStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "• ",
          style: textStyle,
        ),
        Expanded(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
