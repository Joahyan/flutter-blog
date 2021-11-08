import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommonRichText extends StatefulWidget {
  final String text;
  final int maxLines;
  final int minLines;
  final TextStyle? textStyle;
  final String shrinkText;
  final String expandText;
  final Function? onShrink;
  final Function? onExpand;

  CommonRichText(
      {this.text = '',
      this.maxLines = 4,
      this.minLines = 1,
      this.textStyle,
      this.shrinkText = '展开',
      this.expandText = '收起',
      this.onShrink,
      this.onExpand});

  _RichTextState createState() => _RichTextState();
}

class _RichTextState extends State<CommonRichText> {
  bool _isExpand = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonRichText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      TextPainter _textPainter = TextPainter(
          maxLines: widget.maxLines,
          textScaleFactor: MediaQuery.textScaleFactorOf(context),
          locale: Localizations.localeOf(context),
          textAlign: TextAlign.start,
          text: TextSpan(
            text: widget.text,
            style: widget.textStyle,
          ),
          textDirection: Directionality.of(context))
        ..layout(
            minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);
      // 判断是否已经超过最大行数
      if (_textPainter.didExceedMaxLines) {
        final textSize = _textPainter.size;
        final position = _textPainter.getPositionForOffset(Offset(
          textSize.width - _textPainter.width,
          textSize.height,
        ));
        // 默认endOffset = position.offset -1;但是这样导致展开两字有时会换行，故再减了1
        final endOffset = _textPainter.getOffsetBefore(position.offset -1);
        return RichText(
            overflow: TextOverflow.clip,
            text: TextSpan(
                // 截取 0-endOffset 的字符串，再在后面拼接展开/收起
                text: !_isExpand
                    ? widget.text
                    : widget.text.substring(0, endOffset),
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: _isExpand ? widget.shrinkText : widget.expandText,
                      style: TextStyle(color: Colors.lightBlueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _isExpand = !_isExpand;
                          });
                        })
                ]));
      } else {
        return Text.rich(TextSpan(text: widget.text));
      }
    });
  }
}
