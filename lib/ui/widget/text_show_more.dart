import 'package:flutter/material.dart';
import 'package:tentura/consts.dart';

class TextShowMore extends StatefulWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;
  final int maxLines;
  final TextOverflow overflow;

  const TextShowMore(
    this.text, {
    this.textAlign = TextAlign.left,
    this.style,
    this.maxLines = kMaxLines,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  @override
  TextShowMoreState createState() => TextShowMoreState();
}

class TextShowMoreState extends State<TextShowMore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final style = widget.style;

    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    final numberOfLines = painter.computeLineMetrics().length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          textAlign: widget.textAlign,
          style: style,
          maxLines: _isExpanded ? numberOfLines + 1 : widget.maxLines,
          overflow: widget.overflow,
        ),
        if (numberOfLines > widget.maxLines)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                _isExpanded ? 'Hide' : 'Read more',
              ),
            ),
          ),
      ],
    );
  }
}
